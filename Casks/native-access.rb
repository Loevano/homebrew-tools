cask "native-access" do
  version "3.25.1"
  sha256 :no_check

  url "https://na-update.native-instruments.com/arm64/Native-Access-arm64-mac-latest.zip"
  name "Native Access"
  desc "Administration tool for Native Instruments products"
  homepage "https://www.native-instruments.com/en/specials/native-access-2/"

  auto_updates true
  depends_on arch: :arm64
  depends_on macos: :monterey

  app "Native Access.app"

  uninstall launchctl: "com.native-instruments.NativeAccess.Helper2",
            quit:      "com.native-instruments.Native Access",
            delete:    [
              "/Library/Application Support/Native Instruments",
              "/Library/Preferences/com.native-instruments.NTKDaemon.plist",
              "/Library/PrivilegedHelperTools/com.native-instruments.NativeAccess.Helper2",
            ]
end
