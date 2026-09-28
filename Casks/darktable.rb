# Mirror of the upstream homebrew/cask definition, which Homebrew disabled on
# 2026-09-01 (fails_gatekeeper_check: darktable ships ad-hoc-signed, non-notarized
# DMGs). Third-party taps are the Homebrew-sanctioned home for such apps.
# Bump `version` + both sha256 values on each upstream release:
#   https://github.com/darktable-org/darktable/releases
cask "darktable" do
  arch arm: "arm64", intel: "x86_64"

  version "5.6.1"
  sha256 arm:   "155c25a48e06023eeeda3640f6f4fc7848bc1ad8e7384ba1d7b63098986fbeda",
         intel: "ab09e11d548a7028f7bacc2bc4549a272c4e8d385be0e38ecc9e7943914abe61"

  on_arm do
    depends_on macos: :sonoma
  end
  on_intel do
    depends_on macos: :sequoia
  end

  url "https://github.com/darktable-org/darktable/releases/download/release-#{version.major_minor_patch}/darktable-#{version}-#{arch}.dmg",
      verified: "github.com/darktable-org/darktable/"
  name "darktable"
  desc "Photography workflow application and raw developer"
  homepage "https://www.darktable.org/"

  livecheck do
    url "https://www.darktable.org/install/"
    regex(/href=.*?darktable[._-]v?(\d+(?:\.\d+)+)[._-]#{arch}\.dmg/i)
  end

  depends_on :macos

  app "darktable.app"

  uninstall quit: "org.darktable"

  zap trash: [
    "~/.cache/darktable",
    "~/.config/darktable",
    "~/.local/share/darktable",
    "~/Library/Saved Application State/org.darktable.savedState",
  ]
end
