cask "live" do
  version "1.0"
  sha256 :no_check

  url "file:///dev/null"
  name "Live"
  desc "Live MacBook cask collection"
  homepage "https://github.com/Loevano/homebrew-tools"

  depends_on cask: "loevano/tools/dante-controller"
  depends_on cask: "loevano/tools/dante-virtual-soundcard"
  depends_on cask: "loevano/tools/ilok-license-manager"
  depends_on cask: "loevano/tools/rme-madiface-usb-driver"
  depends_on cask: "loevano/tools/totalmix-fx"
  depends_on cask: "reaper"
end
