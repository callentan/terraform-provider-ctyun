# 资源全属性目录生成器

输出入口：[`docs/resource-catalog/README.md`](../../docs/resource-catalog/README.md)。

生成器只读取源码、文档和示例，不编译或配置 provider，也不调用天翼云 API。
先以 Go AST 解析实际注册表、构造函数和 Metadata，再递归读取静态 Schema；
用 HCL 解析器核对示例，使用 Terraform 格式化新模板。
不支持的动态 Schema、未知属性类型和重复注册会直接报错，而不是静默省略。
当前静态提取只接受显式字符串属性键及直接 Schema 赋值；
常量键、间接 helper 调用、完整 Schema 赋值后的二次修改会拒绝处理，需先扩展解析或进行运行时导出。

## 依赖

- Python 3.10 或更新版本；项目存在 `.venv` 时应使用其中的解释器。
- `requirements.txt` 中的 Go AST / HCL 解析器，使用所选 Python 的 `-m pip install -r` 安装。
- Terraform >= 1.5.7，需要在 PATH 中；这里只调用 `terraform fmt`，不调用 `init`、`validate`、`plan` 或 `apply`。
- Git，用于记录相关源码最近的提交和未提交状态。

生成命令示例（PowerShell 7；替换为实际解释器和仓库绝对路径）：

```powershell
& 'C:\repo\.venv\Scripts\python.exe' @('-X', 'utf8', '-u', 'C:\repo\scripts\resource_catalog\generate.py', '--root', 'C:\repo')
```

在参数数组末尾加 `'--check'` 可只检查目录是否与源码一致，不写入文件。
生成器为所有子进程设置明确的工作目录；不要求从仓库根目录启动。
文件内容确定性生成，没有随运行时间变化的时间戳；CSV 使用 UTF-8 BOM，便于 Excel 读取中文。
格式化使用任务临时目录中的空 Terraform CLI 配置，不读取或修改用户级 `terraform.rc`；
子进程退出码和诊断输出均会保留。

行为测试（PowerShell 7）：

```powershell
& 'C:\repo\.venv\Scripts\python.exe' @('-X', 'utf8', '-u', '-m', 'unittest', 'discover', '--start-directory', 'C:\repo\scripts\resource_catalog')
```

## 文件职责

| 文件 | 职责 |
| --- | --- |
| `catalog.py` | Go AST、注册关系、递归属性、TF 输入结构与现有文档/示例审计 |
| `generate.py` | 中文 Markdown、TF、JSON、CSV 渲染，格式化、完整性核对及写入/检查 |
| `test_catalog.py` | 注册过滤、只读/可配置区分、嵌套属性、类型、注释和文档漂移等行为测试 |
| `test_generate.py` | 资源/属性导出、稳定映射键及确定性输出测试 |

## 输出契约与边界

- 每个已注册 resource 对应一份详情页和一份独立 `.tf`；data source 单独列索引。
- `variable.config` 展示全部可配置输入的类型和嵌套结构，`resource` 只赋值可配置的顶层字段。
  `Optional + Computed` 不会被误排除，只读字段在模板尾部用引用注释列出。
- 生成前会独立解析模板的 HCL，核对输入路径、类型、可选标记和 resource 赋值。
  不把“语法能解析”当作“配置能通过 provider 校验或云端部署”。
- 属性表和 CSV 保留 Schema 原始的默认值、校验器、计划修饰器表达式及源码行。
  不执行这些表达式，不声称解析了它们引用的所有常量或业务条件。
- `attributes.csv` 的 `(resource_type, attribute_path)` 是稳定关联键。
  Azure 映射从 `azure-mapping-template.csv` **复制**到另一个手工维护的文件，避免再生成时覆盖人工映射。
- 生成目录内若有未知文件或过期文件，生成器会停止并要求人工检查，不会自行递归删除目录。
- `--check` 也重新读取当前 docs/examples。因此这些示例变更后，需要重新生成审计结果。

当前快照采用静态源码证据，未进行编译后的 provider schema 导出或真实云端 CRUD 验证。
未知动态构造会失败；新增 schema block、自定义类型等结构时，应先补充相应的提取/模板行为测试再扩展生成器。
