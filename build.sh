#!/usr/bin/env bash
set -eu

PYTHONPATH=.
export PYTHONPATH
if type python3 >/dev/null 2>/dev/null; then
  python3 ./.automation/build.py "$@"
else
  python ./.automation/build.py "$@"
fi

# Prettify markdown tables
echo "Formatting markdown tables..."
# shellcheck disable=SC2086
MD_FILES=$(find . -type f -name "*.md" -not -path "*/node_modules/*" -not -path "*/.automation/*" -not -path "*/licenses/*") && npx markdown-table-formatter $MD_FILES
# shellcheck disable=SC2086
MD_FILES_2=$(find . -type f -name "*.md" -not -path "*/node_modules/*" -not -path "*/.automation/*" -path "*/licenses/*") && npx markdown-table-formatter $MD_FILES_2

# Format JSON schema HTML documentation if --doc is set
for i in "$@"; do
  if [[ $i == "--doc" ]]; then
    echo "Generating JSON Schema HTML documentation"
    cd .automation && bash build_schemas_doc.sh && cd ..
    break
  fi
done

# Build online documentation
if type python3 >/dev/null 2>/dev/null; then
  python3 -m mkdocs build
else
  python -m mkdocs build
fi

# Prettify `search_index.json` after `mkdocs`
# `mkdocs` removed its own prettify few years ago: https://github.com/mkdocs/mkdocs/pull/1128
python -m json.tool ./site/search/search_index.json >./site/search/search_index_new.json
mv -f -- ./site/search/search_index_new.json ./site/search/search_index.json
