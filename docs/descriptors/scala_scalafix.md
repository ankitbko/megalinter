<!-- markdownlint-disable MD033 MD041 -->
<!-- Generated by .automation/build.py, please do not update manually -->
# <a href="https://scalacenter.github.io/scalafix/" target="blank" title="Visit linter Web Site"><img src="https://scalacenter.github.io/scalafix/img/scalacenter2x.png" alt="scalafix" height="100px"></a>scalafix

- Web Site: [**https://scalacenter.github.io/scalafix/**](https://scalacenter.github.io/scalafix/)
- Version: **0.9.21**

## Configuration

### scalafix configuration

- [Configure scalafix rules](https://scalacenter.github.io/scalafix/docs/users/configuration.html)
  - If custom .scalafix.conf is not found, [.scalafix.conf](https://github.com/nvuillam/mega-linter/tree/master/TEMPLATES/.scalafix.conf) will be used
- [Disable scalafix rules in files](https://scalacenter.github.io/scalafix/docs/users/suppression.html)

### Mega-linter configuration

- Enable scalafix by adding `SCALA` in [ENABLE_LINTERS variable](https://github.com/nvuillam/mega-linter#activation-and-deactivation)
- Disable scalafix by adding `SCALA` in [DISABLE_LINTERS variable](https://github.com/nvuillam/mega-linter#activation-and-deactivation)

| Variable | Description | Default value |
| ----------------- | -------------- | -------------- |
| SCALA_ARGUMENTS | User custom arguments to add in linter CLI call<br/>Ex: `-s --foo "bar"` |  |
| SCALA_FILTER_REGEX_INCLUDE | Custom regex including filter<br/>Ex: `\/(src\|lib)\/` | Include every file |
| SCALA_FILTER_REGEX_EXCLUDE | Custom regex excluding filter<br/>Ex: `\/(test\|examples)\/` | Exclude no file |
| SCALA_FILE_NAME | scalafix configuration file name</br>Use `LINTER_DEFAULT` to let the linter find it | `.scalafix.conf` |
| SCALA_RULES_PATH | Path where to find linter configuration file | Workspace folder, then Mega-Linter default rules |
| SCALA_DISABLE_ERRORS | Run linter but disable crash if errors found | `false` |

## Behind the scenes

### How are identified applicable files

- File extensions:
  - `.scala`


### Example calls

```shell
scalafix myfile.scala
```

```shell
scalafix --config .scalafix.conf myfile.scala
```


### Help content

```shell
Scalafix 0.9.21
Usage: scalafix [options] [<path> ...]

Scalafix is a refactoring and linting tool. Scalafix supports both syntactic and
semantic linter and rewrite rules. Syntactic rules can run on source code
without compilation. Semantic rules can run on source code that has been
compiled with the SemanticDB compiler plugin.

Common options:

  --rules | -r [String ...] (default: [])
    Scalafix rules to run, for example ExplicitResultTypes. The syntax for rules is
    documented in
    https://scalacenter.github.io/scalafix/docs/users/configuration#rules

  --files | -f [<path> ...] (default: [])
    Files or directories (recursively visited) to fix.

  --config <path> (default: null)
    File path to a .scalafix.conf configuration file. Defaults to .scalafix.conf in
    the current working directory, if any.

  --check
    Check that all files have been fixed with scalafix, exiting with non-zero code
    on violations. Won't write to files.

  --stdout
    Print fixed output to stdout instead of writing in-place.

  --diff
    If set, only apply scalafix to added and edited files in git diff against the
    master branch.

  --diff-base String (default: null)
    If set, only apply scalafix to added and edited files in git diff against a
    provided branch, commit or tag.

  --syntactic
    Run only syntactic rules, ignore semantic rules even if they are explicitly
    configured in .scalafix.conf or via --rules

  --verbose
    Print out additional diagnostics while running scalafix.

  --help | -h
    Print out this help message and exit

  --version | -v
    Print out version number and exit

Semantic options:

  --classpath Classpath (default: "<classpath>")
    Full classpath of the files to fix, required for semantic rules. The source
    files that should be fixed must be compiled with semanticdb-scalac.
    Dependencies are required by rules like ExplicitResultTypes, but the
    dependencies do not need to be compiled with semanticdb-scalac.

  --sourceroot <path> (default: null)
    Absolute path passed to semanticdb with -P:semanticdb:sourceroot:<path>.
    Relative filenames persisted in the Semantic DB are absolutized by the
    sourceroot. Defaults to current working directory if not provided.

  --auto-classpath
    If set, automatically infer the --classpath flag by scanning for directories
    with META-INF/semanticdb

  --auto-classpath-roots [<path> ...] (default: [])
    Additional directories to scan for --auto-classpath

  --scalac-options [String ...] (default: [])
    The scala compiler options used to compile this --classpath, for example
    -Ywarn-unused-import

  --scala-version String (default: "2.13.3")
    The Scala compiler version that was used to compile this project.

Tab completions:

  --bash
    Print out bash tab completions. To install:
    ```
    # macOS, requires "brew install bash-completion"
    scalafix --bash > /usr/local/etc/bash_completion.d/scalafix
    # Linux
    scalafix --bash > /etc/bash_completion.d/scalafix
    ```

  --zsh
    Print out zsh tab completions. To install:
    ```
    scalafix --zsh > /usr/local/share/zsh/site-functions/_scalafix
    unfunction _scalafix
    autoload -U _scalafix
    ```

Less common options:

  --exclude [<glob> ...] (default: [])
    Unix-style glob for files to exclude from fixing. The glob syntax is defined by
    `nio.FileSystem.getPathMatcher`.

  --tool-classpath URLClassLoader (default: "<classloader>")
    Additional classpath for compiling and classloading custom rules, as a set of
    filesystem paths, separated by ':' on Unix or ';' on Windows.

  --charset Charset (default: "UTF-8")
    The encoding to use for reading/writing files

  --no-sys-exit
    If set, throw exception in the end instead of System.exit

  --no-stale-semanticdb
    Don't error on stale semanticdb files.

  --settings ScalafixConfig (default: {})
    Custom settings to override .scalafix.conf

  --out-from String (default: null)
    Write fixed output to custom location instead of in-place. Regex is passed as
    first argument to file.replaceAll(--out-from, --out-to), requires --out-to.

  --out-to String (default: null)
    Companion of --out-from, string that is passed as second argument to
    fileToFix.replaceAll(--out-from, --out-to)

  --auto-suppress-linter-errors
    Insert /* scalafix:ok */ suppressions instead of reporting linter errors.

  --cwd <path> (default: "/")
    The current working directory


```

### Installation on mega-linter Docker image

- Dockerfile commands :
```dockerfile
# Parent descriptor install
RUN curl -fLo coursier https://git.io/coursier-cli && \
        chmod +x coursier

# Linter install
RUN ./coursier install scalafix --quiet --install-dir /usr/bin
```
