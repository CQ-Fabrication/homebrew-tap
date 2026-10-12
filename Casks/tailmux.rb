# This file is updated by the release workflow of CQ-Fabrication/tailmux.
# Manual edits will be overwritten on the next release.
cask "tailmux" do
  version "0.3.0"
  sha256 "5244c620f7e1236d276e272af6db97943f4e6c288c011064b2773930fdc5b12a"

  url "https://assets.tailmux.app/TailMux-#{version}-macos-universal.dmg"
  name "TailMux"
  desc "Run multiple isolated Tailscale tailnets at once, routed by hostname suffix"
  homepage "https://tailmux.app"

  auto_updates true
  # No conflicts_with formula: here. Homebrew deprecated the key in 4.6.7,
  # disabled it in 5.0.0 and removed it in 5.1.0 with no replacement; casks may
  # only declare conflicts with other casks. The overlap with the CLI formula
  # (both provide bin/tailmux) is still caught by the binary artifact install.
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
