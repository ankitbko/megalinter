<!-- markdownlint-disable MD033 MD041 -->
<!-- Generated by .automation/build.py, please do not update manually -->
# jsonlint

- Web Site: [**https://github.com/zaach/jsonlint**](https://github.com/zaach/jsonlint#readme)
- Version: **1.6.3**

## Configuration

### jsonlint configuration

- jsonlint has no known capability to configure custom rules
- jsonlint has no known capability to inline-disable rules

### Mega-linter configuration

- Enable jsonlint by adding `JSON` in [ENABLE_LINTERS variable](https://github.com/nvuillam/mega-linter#activation-and-deactivation)
- Disable jsonlint by adding `JSON` in [DISABLE_LINTERS variable](https://github.com/nvuillam/mega-linter#activation-and-deactivation)

| Variable | Description | Default value |
| ----------------- | -------------- | -------------- |
| JSON_ARGUMENTS | User custom arguments to add in linter CLI call<br/>Ex: `-s --foo "bar"` |  |
| JSON_FILTER_REGEX_INCLUDE | Custom regex including filter<br/>Ex: `\/(src\|lib)\/` | Include every file |
| JSON_FILTER_REGEX_EXCLUDE | Custom regex excluding filter<br/>Ex: `\/(test\|examples)\/` | Exclude no file |
| JSON_DISABLE_ERRORS | Run linter but disable crash if errors found | `false` |

## Behind the scenes

### How are identified applicable files

- File extensions:
  - `.json`


### Example calls

```shell
jsonlint myfile.json
```


### Help content

```shell

Usage: jsonlint [file] [options]

file     file to parse; otherwise uses stdin

Options:
   -v, --version            print version and exit
   -s, --sort-keys          sort object keys
   -i, --in-place           overwrite the file
   -t CHAR, --indent CHAR   character(s) to use for indentation  [  ]
   -c, --compact            compact error display
   -V, --validate           a JSON schema to use for validation
   -e, --environment        which specification of JSON Schema the validation file uses  [json-schema-draft-03]
   -q, --quiet              do not print the parsed json to STDOUT  [false]
   -p, --pretty-print       force pretty printing even if invalid


```

### Installation on mega-linter Docker image

- NPM packages (node.js):
  - [jsonlint](https://www.npmjs.com/package/jsonlint)