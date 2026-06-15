cask "commandtabfree" do
  version "100.0.0"
  sha256 "95545289a212ae5c960fea20eddea7b4f276f360bb0ba0260653fe3cf92e7a7b"

  url "https://github.com/KofTwentyTwo/alt-tab-free/releases/download/v#{version}/CommandTabFree-#{version}.zip",
      verified: "github.com/KofTwentyTwo/alt-tab-free/"
  name "CommandTabFree"
  desc "Switch windows via previews; de-paywalled fork of AltTab"
  homepage "https://github.com/KofTwentyTwo/alt-tab-free"

  livecheck do
    url :url
    strategy :github_latest
  end

  app "CommandTabFree.app"

  # CommandTabFree is not yet signed with an Apple Developer ID or notarized, so
  # macOS attaches a download-quarantine flag that Gatekeeper would otherwise block
  # on first launch. Strip it here. Remove this stanza once the app is notarized.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/CommandTabFree.app"]
  end

  uninstall quit: "com.koftwentytwo.commandtabfree"

  zap trash: [
    "~/Library/Caches/com.koftwentytwo.commandtabfree",
    "~/Library/HTTPStorages/com.koftwentytwo.commandtabfree",
    "~/Library/Preferences/com.koftwentytwo.commandtabfree.plist",
    "~/Library/Saved Application State/com.koftwentytwo.commandtabfree.savedState",
  ]
end
