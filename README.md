# KofTwentyTwo Homebrew Tap

Homebrew formulas for KofTwentyTwo tools.

`limen` releases update `Formula/limen.rb` automatically from the
`KofTwentyTwo/limen` release workflow.

## CommandTabFree (cask)

A free, de-paywalled fork of [AltTab](https://github.com/lwouis/alt-tab-macos),
the macOS window switcher:

```sh
brew install --cask koftwentytwo/tap/commandtabfree
```

Unsigned / not yet notarized; the cask removes the download quarantine so it
launches without a Gatekeeper prompt. On first launch, grant Accessibility and
Screen Recording in System Settings. Source (GPL-3.0):
<https://github.com/KofTwentyTwo/alt-tab-free>.
