#!/bin/bash
rm -rf dist
cp -r node_modules/graphql-upload ./dist
jq 'del(.exports, .homepage, .bugs, .devDependencies, .scripts) | .repository = "https://github.com/alex-kinokon/graphql-upload-cjs" | .name = "@proteria/graphql-upload" | .author = "alex-kinokon"' node_modules/graphql-upload/package.json > ./dist/package.json
cp README.md ./dist

npx tsc &>/dev/null

for file in dist/*.mjs; do
  base="${file%.mjs}"
  sed -i '' \
    -e 's/\.mjs"/\.js"/g' \
    -e 's/import \([A-Za-z]*\) from "\.\/\(.*\)"/const { default: \1 } = require(".\/\2")/g' \
    "$file"
  npx babel "$file" --out-file="$base.js" --plugins=@babel/plugin-transform-modules-commonjs
  rm "$file"
  mv "$base.d.mts" "$base.d.ts"
done

for dts in dist/*.d.ts; do
  sed -i '' -e 's/\.mjs"/\.js"/g' "$dts"
done