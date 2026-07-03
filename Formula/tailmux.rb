# typed: false
# frozen_string_literal: true

# This file is managed by GoReleaser (brews section of CQ-Fabrication/tailmux).
# Manual edits will be overwritten on the next release.
class Tailmux < Formula
  desc "Run multiple isolated Tailscale tailnets at once, routed by hostname suffix"
  homepage "https://tailmux.app"
  version "0.0.7"

  on_macos do
    if Hardware::CPU.arm?
      url "https://assets.tailmux.app/tailmux_0.0.7_darwin_arm64.tar.gz"
      sha256 "ab72d8534e44f78da1fa7470d236a731bbe3e9db621320f87e3ae4e44f9c7444"
    end
    if Hardware::CPU.intel?
      url "https://assets.tailmux.app/tailmux_0.0.7_darwin_amd64.tar.gz"
      sha256 "b04e3332d5083f24de7b0ca63dd2e1b64c2a31a406312f9094b73b5bacba2505"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://assets.tailmux.app/tailmux_0.0.7_linux_arm64.tar.gz"
      sha256 "8ca02839eee961f273c06dac6dbe30217ab7778736013abba3109488d6eede2e"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://assets.tailmux.app/tailmux_0.0.7_linux_amd64.tar.gz"
      sha256 "dabf0c653fca20e494280e354ee8aa88286ce7e3b845a247948915e1f0a4ad19"
    end
  end

  def install
    bin.install "tailmux"
  end

  def caveats
    <<~EOS
      TailMux requires a one-time license: https://tailmux.app/pricing

      On macOS, prefer the cask — it installs the menu-bar app with this
      CLI bundled:
        brew install --cask cq-fabrication/tap/tailmux
    EOS
  end

  test do
    system "#{bin}/tailmux", "version"
  end
end
