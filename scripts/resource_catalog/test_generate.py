import csv
from contextlib import redirect_stderr
import io
import json
from pathlib import Path
from tempfile import TemporaryDirectory
import sys
import unittest

import catalog
import generate
from test_catalog import fixture_resource


class OutputTests(unittest.TestCase):
    def fixture(self):
        resource = fixture_resource()
        resource.update({
            "module": "example", "source_line": 1, "service_url": "",
            "document_file": "docs/resources/test.md", "document_exists": False,
            "example_file": "", "import_state_implemented": False,
            "audit": catalog.audit_document(resource, ""),
        })
        return {
            "format_version": 1, "provider_name": "ctyun", "provider_version": "1.2.3",
            "source_commit": "fixture", "source_sha256": "0" * 64, "source_dirty": False,
            "resources": [resource], "data_sources": [], "unregistered": [],
            "unregistered_documents": [],
            "provider": {"attributes": [], "source_file": "provider.go", "source_line": 1},
        }

    def test_every_registered_resource_has_detail_template_and_summary_row(self):
        inventory = self.fixture()
        files = generate.render_files(
            inventory, {"ctyun_test": catalog.render_template(inventory["resources"][0])}
        )
        self.assertTrue({"README.md", "AUDIT.md", "catalog.json", "attributes.csv",
                         "resources.csv", "azure-mapping-template.csv",
                         "details/ctyun_test.md", "templates/ctyun_test.tf"} <= files.keys())
        resources = list(csv.DictReader(io.StringIO(files["resources.csv"].lstrip("\ufeff"))))
        self.assertEqual([r["resource_type"] for r in resources], ["ctyun_test"])
        self.assertEqual(resources[0]["detail"], "details/ctyun_test.md")
        self.assertEqual(resources[0]["template"], "templates/ctyun_test.tf")
        self.assertEqual(json.loads(files["catalog.json"])["provider_version"], "1.2.3")

    def test_csv_preserves_nested_paths_flags_and_unassessed_azure_mapping(self):
        inventory = self.fixture()
        files = generate.render_files(
            inventory, {"ctyun_test": catalog.render_template(inventory["resources"][0])}
        )
        self.assertIn("attributes.csv", files)
        attributes = {
            row["attribute_path"]: row
            for row in csv.DictReader(io.StringIO(files["attributes.csv"].lstrip("\ufeff")))
        }
        self.assertEqual(len(attributes), 10)
        self.assertEqual(attributes["labels[].value"]["configurable"], "true")
        self.assertEqual(attributes["labels[].server_id"]["configurable"], "false")
        self.assertEqual(attributes["size"]["default_expression"], "int64default.StaticInt64(10)")
        mappings = list(csv.DictReader(io.StringIO(files["azure-mapping-template.csv"].lstrip("\ufeff"))))
        self.assertEqual(len(mappings), 10)
        self.assertTrue(all(row["mapping_status"] == "unassessed" for row in mappings))
        self.assertTrue(all(row["azure_resource_type"] == "" for row in mappings))
        self.assertEqual({row["ctyun_attribute_path"] for row in mappings}, set(attributes))

    def test_generation_is_deterministic(self):
        inventory = self.fixture()
        templates = {"ctyun_test": catalog.render_template(inventory["resources"][0])}
        first = generate.render_files(inventory, templates)
        self.assertIn("README.md", first)
        self.assertEqual(first, generate.render_files(inventory, templates))

    def test_regex_constraints_are_not_treated_as_markdown_links(self):
        with TemporaryDirectory() as temporary:
            root = Path(temporary).resolve()
            files = {"README.md": generate.table(["Constraint"], [[generate.code(r"^[0-6](,[0-6])*$")]])}
            generate.verify_links(root, root / "docs" / "resource-catalog", files)

    def test_real_broken_links_are_reported(self):
        with TemporaryDirectory() as temporary:
            root = Path(temporary).resolve()
            with self.assertRaisesRegex(catalog.CatalogError, "Broken link"):
                generate.verify_links(root, root / "docs", {"README.md": "[missing](missing.md)"})

    def test_existing_crlf_inside_a_csv_value_is_not_a_stale_file(self):
        with TemporaryDirectory() as temporary:
            output = Path(temporary)
            content = 'name,description\nexample,"first\r\nsecond"\n'
            (output / "attributes.csv").write_bytes(content.encode("utf-8"))
            self.assertEqual(generate.changed_files(output, {"attributes.csv": content}), [])
            self.assertEqual(
                generate.changed_files(output, {"attributes.csv": content + "new,value\n"}),
                ["attributes.csv"],
            )

    def test_successful_command_does_not_hide_stderr(self):
        errors = io.StringIO()
        with TemporaryDirectory() as temporary, redirect_stderr(errors):
            output = generate.run_command(
                [sys.executable, "-c", "import sys; sys.stderr.write('warning\\n'); print('result')"],
                Path(temporary),
            )
        self.assertEqual(output, "result")
        self.assertIn("warning", errors.getvalue())


if __name__ == "__main__":
    unittest.main()
