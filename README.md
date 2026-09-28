# KofTwentyTwo Homebrew Tap

Homebrew formulas and casks for KofTwentyTwo open-source tools.

## Nuncio — Sovereign Mail, Calendar & Contacts Suite

```sh
brew install koftwentytwo/tap/nuncio
```

Includes binaries:
- `nuncio-cli`: POSIX scriptable command-line interface
- `nuncio-tui`: Terminal UI (Ratatui + Vim motions)
- `nuncio-mcp`: Native Model Context Protocol (MCP) AI server
- `nunciod`: Centralized background daemon

## darktable (cask)

Mirror of the upstream cask, which Homebrew disabled on 2026-09-01 because
darktable's DMGs are not notarized. First launch after install or upgrade
needs a one-time Gatekeeper approval (System Settings > Privacy & Security >
Open Anyway).

```bash
brew install --cask koftwentytwo/tap/darktable
```

## CommandTabFree (cask)

```sh
brew install --cask koftwentytwo/tap/commandtabfree
```
