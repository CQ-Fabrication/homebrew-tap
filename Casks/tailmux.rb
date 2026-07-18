# This file is updated by the release workflow of CQ-Fabrication/tailmux.
# Manual edits will be overwritten on the next release.
cask "tailmux" do
  version "0.1.2"
  sha256 "ba9be79e396c3b1aa607b51c3fba832d56cdd4e7a2a8f2b40c0cf50a1cdaf427"

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
