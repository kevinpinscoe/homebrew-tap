# kevinpinscoe/homebrew-tap

Homebrew tap for [kevinpinscoe](https://github.com/kevinpinscoe) Go tools.

## Install

```bash
brew tap kevinpinscoe/tap
```

Then install any available tool:

```bash
brew install get-wx
brew install metar-tool
```

Or in one step:

```bash
brew install kevinpinscoe/tap/get-wx
brew install kevinpinscoe/tap/metar-tool
```

## Available formulae

| Formula | Description |
|---|---|
| `get-wx` | Eastern Tennessee weather forecast fetcher |
| `metar-tool` | METAR aviation weather decoder |

## How formulae land here

GoReleaser pushes updated formula files to `Formula/` automatically when a new
tag is pushed to `kevinpinscoe/get-wx` or `kevinpinscoe/metar-tool`.
The `HOMEBREW_TAP_TOKEN` secret in those repos is a fine-grained PAT with
Contents R/W access scoped to this repo only.
