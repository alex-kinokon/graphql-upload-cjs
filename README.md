# graphql-upload-cjs

![Latest upstream version](https://img.shields.io/npm/v/graphql-upload?label=latest%20upstream)
![Current upstream version](https://img.shields.io/badge/current%20upstream-v16.0.2-brightgreen)

```sh
npm install @proteria/graphql-upload
```

See [original README](https://github.com/jaydenseric/graphql-upload/blob/13fde6064e5613cfa283d07b88e1e0f2e6fe884d/readme.md) for `graphql-upload`.

## Why

[36 closed issues for "ESM"](https://github.com/jaydenseric/graphql-upload/issues?q=is%3Aissue+sort%3Aupdated-desc+esm+is%3Aclosed) in `graphql-upload` repo as of May 19, 2023.

## How

This repo just runs a script to repackage every `mjs` file in `graphql-upload` into CJS and bundle the TypeScript definitions.

## Differences

1. CommonJS.
2. No need to [configure your TypeScript](https://github.com/jaydenseric/graphql-upload/blob/e01b5d5541760d529b06c900883c5fa7febcff00/readme.md#requirements) to make it pick up the types.

## Build

```sh
pnpm install
pnpm run build
```
