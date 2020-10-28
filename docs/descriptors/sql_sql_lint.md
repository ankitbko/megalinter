<!-- markdownlint-disable MD033 MD041 -->
<!-- Generated by .automation/build.py, please do not update manually -->
# sql-lint

- Web Site: [**https://github.com/joereynolds/sql-lint**](https://github.com/joereynolds/sql-lint#readme)
- Version: **0.0.15**

## Configuration

### sql-lint configuration

- [Configure sql-lint rules](https://sql-lint.readthedocs.io/en/latest/files/configuration.html)
  - If custom .sql-config.json is not found, [.sql-config.json](https://github.com/nvuillam/mega-linter/tree/master/TEMPLATES/.sql-config.json) will be used
- sql-lint has no known capability to inline-disable rules

### Mega-linter configuration

- Enable sql-lint by adding `SQL` in [ENABLE_LINTERS variable](https://github.com/nvuillam/mega-linter#activation-and-deactivation)
- Disable sql-lint by adding `SQL` in [DISABLE_LINTERS variable](https://github.com/nvuillam/mega-linter#activation-and-deactivation)

| Variable | Description | Default value |
| ----------------- | -------------- | -------------- |
| SQL_ARGUMENTS | User custom arguments to add in linter CLI call<br/>Ex: `-s --foo "bar"` |  |
| SQL_FILTER_REGEX_INCLUDE | Custom regex including filter<br/>Ex: `\/(src\|lib)\/` | Include every file |
| SQL_FILTER_REGEX_EXCLUDE | Custom regex excluding filter<br/>Ex: `\/(test\|examples)\/` | Exclude no file |
| SQL_FILE_NAME | sql-lint configuration file name</br>Use `LINTER_DEFAULT` to let the linter find it | `.sql-config.json` |
| SQL_RULES_PATH | Path where to find linter configuration file | Workspace folder, then Mega-Linter default rules |
| SQL_DISABLE_ERRORS | Run linter but disable crash if errors found | `false` |

## Behind the scenes

### How are identified applicable files

- File extensions:
  - `.sql`


### Example calls

```shell
sql-lint myfile.sql
```

```shell
sql-lint --config .sql-config.json myfile.sql
```


### Help content

```shell
Usage: sql-lint [options]

Options:
  -V, --version          output the version number
  --fix [string]         The .sql string to fix
  -d, --driver <string>  The driver to use, must be one of ['mysql',
                         'postgres']
  -v, --verbose          Brings back information on the what it's linting and
                         the tokens generated
  --format <string>      The format of the output, can be one of ['simple',
                         'json'] (default: "simple")
  --host <string>        The host for the connection
  --user <string>        The user for the connection
  --password <string>    The password for the connection
  --port <string>        The port for the connection
  --config <string>      The path to the configuration file
  -h, --help             display help for command

```

### Installation on mega-linter Docker image

- NPM packages (node.js):
  - [sql-lint](https://www.npmjs.com/package/sql-lint)