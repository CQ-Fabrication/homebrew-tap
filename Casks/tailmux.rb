# This file is updated by the release workflow of CQ-Fabrication/tailmux.
# Manual edits will be overwritten on the next release.
cask "tailmux" do
  version "0.2.0"
  sha256 "caf6cc2a9bcb5c1bd7d912b9a664b6605b6b2b86ba97d161031cf4ff478c4666"

  url "https://assets.tailmux.app/TailMux-#{version}-macos-universal.dmg"
  name "TailMux"
  desc "Run multiple isolated Tailscale tailnets at once, routed by hostname suffix"
  homepage "https://tailmux.app"

  auto_updates true
  conflicts_with formula: "cq-fabrication/tap/tailmux"
  depends_on macos: ">= :sonoma"

  app "TailMux.app"
  binary "#{appdir}/TailMux.app/Contents/Resources/tailmux"

  zap trash: [
    "~/.config/tailmux",
    "~/Library/Application Support/TailMux",
    "~/Library/Caches/com.cqfabrication.tailmux.menu",
    "~/Library/Preferences/com.cqfabrication.tailmux.menu.plist",
  ]

  caveats <<~EOS
    TailMux requires a one-time license: https://tailmux.app/pricing

    The app auto-updates via Sparkle, so the version Homebrew knows about
    may fall behind the version actually installed.
  EOS
end
