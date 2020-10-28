<!-- markdownlint-disable MD033 MD041 -->
<!-- Generated by .automation/build.py, please do not update manually -->
# tekton-lint

- Web Site: [**https://github.com/IBM/tekton-lint**](https://github.com/IBM/tekton-lint#readme)
- Version: **0.4.2**

## Configuration

### tekton-lint configuration

- [Configure tekton-lint rules](https://github.com/IBM/tekton-lint#configuring-tekton-lint)
- tekton-lint has no known capability to inline-disable rules

### Mega-linter configuration

- Enable tekton-lint by adding `TEKTON` in [ENABLE_LINTERS variable](https://github.com/nvuillam/mega-linter#activation-and-deactivation)
- Disable tekton-lint by adding `TEKTON` in [DISABLE_LINTERS variable](https://github.com/nvuillam/mega-linter#activation-and-deactivation)

| Variable | Description | Default value |
| ----------------- | -------------- | -------------- |
| TEKTON_ARGUMENTS | User custom arguments to add in linter CLI call<br/>Ex: `-s --foo "bar"` |  |
| TEKTON_FILTER_REGEX_INCLUDE | Custom regex including filter<br/>Ex: `\/(src\|lib)\/` | Include every file |
| TEKTON_FILTER_REGEX_EXCLUDE | Custom regex excluding filter<br/>Ex: `\/(test\|examples)\/` | Exclude no file |
| TEKTON_FILE_NAME | tekton-lint configuration file name</br>Use `LINTER_DEFAULT` to let the linter find it | `.tektonlintrc.yaml` |
| TEKTON_RULES_PATH | Path where to find linter configuration file | Workspace folder, then Mega-Linter default rules |
| TEKTON_DISABLE_ERRORS | Run linter but disable crash if errors found | `false` |

## Behind the scenes

### How are identified applicable files

- File extensions:
  - `.yml`
  - `.yaml`

- Detected file content:
  - `apiVersion: tekton`


### Example calls

```shell
tekton-lint myfile.yml
```


### Help content

```shell
Usage:
tekton-lint <path-to-yaml-files>

Options:
$ tekton-lint --watch   # Run tekton-lint in watch mode
$ tekton-lint --version # Show version number
$ tekton-lint --help    # Show help
$ tekton-lint --color / --no-color   # Forcefully enable/disable colored output
$ tekton-lint --format  # Format output. Available formatters: vscode (default) | stylish | json

Examples:
# Globstar matching
$ tekton-lint '**/*.yaml'

# Exact file path
$ tekton-lint my-pipeline.yaml my-task.yaml

# Multiple glob patterns
$ tekton-lint path/to/my/pipeline.yaml 'path/to/my/tasks/*.yaml'

# Watch mode
$ tekton-lint --watch '**/*.yaml'


```

### Installation on mega-linter Docker image

- NPM packages (node.js):
  - [tekton-lint](https://www.npmjs.com/package/tekton-lint)