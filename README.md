# CQ Fabrication Homebrew Tap

Homebrew formulae and casks for [CQ Fabrication](https://cqfabrication.com) tools.

## TailMux

[TailMux](https://tailmux.app) keeps multiple isolated Tailscale tailnets
reachable at once and routes traffic by hostname suffix. It requires a
one-time license — see [pricing](https://tailmux.app/pricing).

**macOS** — menu-bar app with the CLI bundled (recommended):

```sh
brew install --cask cq-fabrication/tap/tailmux
```

**Linux (or CLI-only)**:

```sh
brew install cq-fabrication/tap/tailmux
```

Binaries are downloaded from `assets.tailmux.app` — the same signed,
checksummed artifacts behind the app's Sparkle update feed. This tap is
updated automatically by the TailMux release pipeline.
