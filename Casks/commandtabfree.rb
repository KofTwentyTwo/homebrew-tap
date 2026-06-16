cask "commandtabfree" do
  version "100.2.0"
  sha256 "167ac3adb6a9421a3adad79dddcfc5d39970f5472201011d67a3a6bab51f48c7"

  url "https://github.com/KofTwentyTwo/CommandTabFree/releases/download/v#{version}/CommandTabFree-#{version}.zip",
      verified: "github.com/KofTwentyTwo/CommandTabFree/"
  name "CommandTabFree"
  desc "Switch windows via previews; de-paywalled fork of AltTab"
  homepage "https://github.com/KofTwentyTwo/CommandTabFree"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on :macos

  app "CommandTabFree.app"

  uninstall quit: "com.koftwentytwo.commandtabfree"

  zap trash: [
    "~/Library/Caches/com.koftwentytwo.commandtabfree",
    "~/Library/HTTPStorages/com.koftwentytwo.commandtabfree",
    "~/Library/Preferences/com.koftwentytwo.commandtabfree.plist",
    "~/Library/Saved Application State/com.koftwentytwo.commandtabfree.savedState",
  ]
end
