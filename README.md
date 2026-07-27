# kevinpinscoe/homebrew-tap

Homebrew tap for [kevinpinscoe](https://github.com/kevinpinscoe) tools.

## Status

Production.

## Purpose

Distributes the CLI tools and desktop apps published under
`github.com/kevinpinscoe` to macOS and Linux via Homebrew. It is one of three
install paths for the CLI tools — the others are the
[APT](https://github.com/kevinpinscoe/apt) and
[RPM](https://github.com/kevinpinscoe/rpm) repositories, which are updated from
the same release tag.

Everything here is a **cask**. There are no formulas — see
[Formulas moved to casks](#formulas-moved-to-casks) below.

## Quick Start

```bash
brew tap kevinpinscoe/tap
brew install --cask get-wx
```

Or in one step, without tapping first:

```bash
brew install --cask kevinpinscoe/tap/get-wx
```

## Available casks

| Cask | Description | Source |
|---|---|---|
| `aws-linux-memory-tools` | AWS Linux memory diagnostics | [aws-linux-memory-tools](https://github.com/kevinpinscoe/aws-linux-memory-tools) |
| `check-git-branch` | Scan git repos for non-default branches or leftover local branches | [tools](https://github.com/kevinpinscoe/tools) |
| `check-git-repos` | Scan git repositories under a root directory for ahead/behind/diverged/uncommitted state | [tools](https://github.com/kevinpinscoe/tools) |
| `get-wx` | Eastern Tennessee weather forecast fetcher | [get-wx](https://github.com/kevinpinscoe/get-wx) |
| `menu-app` | Run repository scripts from a simple TUI menu | [tools](https://github.com/kevinpinscoe/tools) |
| `metar-tool` | METAR aviation weather decoder | [metar-tool](https://github.com/kevinpinscoe/metar-tool) |
| `pause` | Sleep for N seconds with a live countdown status line on stderr | [tools](https://github.com/kevinpinscoe/tools) |
| `skills-tui` | Interactive TUI skill chooser | [skills-tui](https://github.com/kevinpinscoe/skills-tui) |
| `vermilian` | monday.com-style desktop client for self-hosted JetBrains YouTrack | [vermilian](https://github.com/kevinpinscoe/vermilian) |

All CLI casks install on both macOS (arm64) and Linux (amd64 and arm64).
`vermilian` is a macOS arm64 app and is the one exception.

## Formulas moved to casks

Everything in this tap shipped as a formula until 2026-07-27. GoReleaser
deprecated its `brews:` block in v2.10 and announced removal in v2.16, and its
replacement emits casks. Casks stopped being macOS-only when
[Homebrew/brew#19121](https://github.com/Homebrew/brew/pull/19121) added Linux
binary support, so the move costs Linux users nothing.

Two consequences for anyone with an older install:

- The install command gained `--cask`: `brew install --cask <name>`.
- A formula and a cask of the same name cannot coexist. Remove the formula
  first:

  ```bash
  brew uninstall <name>
  brew install --cask <name>
  ```

Existing installs do **not** follow the move on their own.

## Repository Layout

```
homebrew-tap/
├── Casks/          # every cask in this tap; all generated, none hand-edited
│   ├── aws-linux-memory-tools.rb
│   ├── check-git-branch.rb
│   ├── check-git-repos.rb
│   ├── get-wx.rb
│   ├── menu-app.rb
│   ├── metar-tool.rb
│   ├── pause.rb
│   ├── skills-tui.rb
│   └── vermilian.rb
└── README.md
```

## How casks land here

Casks are generated and pushed automatically on release — never edited by hand.
Each file carries a `DO NOT EDIT` header naming the generator that wrote it.
Three pipelines feed this tap:

| Source | Mechanism |
|---|---|
| `get-wx`, `metar-tool`, `skills-tui`, `aws-linux-memory-tools` | GoReleaser's `homebrew_casks:` block, on a `vX.Y.Z` tag |
| `menu-app`, `check-git-repos`, `check-git-branch`, `pause` | `.github/homebrew-cask.py` in [tools](https://github.com/kevinpinscoe/tools), on a `<tool>-vX.Y.Z` tag |
| `vermilian` | its own release workflow |

The first two emit the same cask layout, so every CLI cask here reads alike.

Each source repo holds a `HOMEBREW_TAP_TOKEN` secret with Contents read/write
scoped to this repository only.

To correct a cask, fix the generator in the source repo and cut a release. A
hand-edit here is overwritten by the next one.

## License

MIT, matching the tools it distributes. Each tool's own repository is
authoritative for its license.
