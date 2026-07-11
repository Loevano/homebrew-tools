cask "brave-browser" do
  version "1.92.139.0"
  sha256 "77ba16752824ea8336cc33ecb5cc671b4b7041f7fc1c9be8a305af56b2e3b82d"

  url "https://updates-cdn.bravesoftware.com/sparkle/Brave-Browser/stable-arm64/192.139/Brave-Browser-arm64.dmg",
      verified: "updates-cdn.bravesoftware.com/sparkle/Brave-Browser/"
  name "Brave"
  desc "Web browser focusing on privacy"
  homepage "https://brave.com/"

  auto_updates true
  depends_on arch: :arm64
  depends_on macos: ">= :monterey"

  app "Brave Browser.app"
end
