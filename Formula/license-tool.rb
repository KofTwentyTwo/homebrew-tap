# typed: false
# frozen_string_literal: true

# Homebrew formula for license-tool. Mirrors the GoReleaser-generated formula so a
# future automated release (once HOMEBREW_TAP_TOKEN is valid) overwrites it cleanly.
class LicenseTool < Formula
  desc "Audit and standardize license headers and metadata across codebases"
  homepage "https://github.com/KofTwentyTwo/license-tool"
  version "0.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/KofTwentyTwo/license-tool/releases/download/v0.1.0/license-tool_0.1.0_darwin_arm64.tar.gz"
      sha256 "dad66589b41a077c17bbed1e9873ae199b3424620a49106dafaf2e5dd472fa48"
    end
    on_intel do
      url "https://github.com/KofTwentyTwo/license-tool/releases/download/v0.1.0/license-tool_0.1.0_darwin_amd64.tar.gz"
      sha256 "efdbdcb7af6d3289b9213057ae1343d57af377624659f41bd34959b0a4e8f80d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/KofTwentyTwo/license-tool/releases/download/v0.1.0/license-tool_0.1.0_linux_arm64.tar.gz"
      sha256 "4c3c85599b7e98612a94a5ed9eb4cdc3f8b9f3b7aea2fe367723a25e8682a4d5"
    end
    on_intel do
      url "https://github.com/KofTwentyTwo/license-tool/releases/download/v0.1.0/license-tool_0.1.0_linux_amd64.tar.gz"
      sha256 "de07d15cc70a1a1b0f2869419fab41003d1aa626954fe421e187aabba04d18fa"
    end
  end

  def install
    bin.install "license-tool"
  end

  test do
    assert_match "license-tool", shell_output("#{bin}/license-tool version")
  end
end
