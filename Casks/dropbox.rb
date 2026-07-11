cask "dropbox" do
  version "260.4.2926"
  sha256 "03b5507c71436f3a88657f70dc926059b76b8aa57495690e1fad70105f0f9b75"

  url "https://edge.dropboxstatic.com/dbx-releng/client/Dropbox%20#{version}.arm64.dmg",
      verified: "dropboxstatic.com/dbx-releng/client/"
  name "Dropbox"
  desc "Client for the Dropbox cloud storage service"
  homepage "https://www.dropbox.com/"

  auto_updates true
  depends_on arch: :arm64

  app "Dropbox.app"

  uninstall launchctl: "com.dropbox.DropboxMacUpdate.agent",
            quit:      "com.getdropbox.dropbox",
            kext:      "com.getdropbox.dropbox.kext",
            delete:    [
              "/Library/DropboxHelperTools",
              "/Library/Preferences/com.getdropbox.dropbox.dbkextd.plist",
            ]
end
