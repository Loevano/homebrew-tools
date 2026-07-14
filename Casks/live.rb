cask "live" do
  version "1.0"
  sha256 :no_check

  url "file:///dev/null"
  name "Live"
  desc "Live MacBook cask collection"
  homepage "https://github.com/Loevano/homebrew-tools"

  livecheck do
    skip "Meta cask"
  end

  depends_on cask: "loevano/tools/ableton-live-suite"
  depends_on cask: "loevano/tools/arturia-software-center"
  depends_on cask: "loevano/tools/brave-browser"
  depends_on cask: "loevano/tools/companion"
  depends_on cask: "loevano/tools/dante-controller"
  depends_on cask: "loevano/tools/dante-virtual-soundcard"
  depends_on cask: "loevano/tools/ilok-license-manager"
  depends_on cask: "loevano/tools/max8"
  depends_on cask: "loevano/tools/native-access"
  depends_on cask: "loevano/tools/pigments"
  depends_on cask: "loevano/tools/rme-madiface-usb-driver"
  depends_on cask: "loevano/tools/standardclip"
  depends_on cask: "loevano/tools/totalmix-fx"
  depends_on cask: "loevano/tools/touchosc"
  depends_on cask: "loevano/tools/u-he-diva"
end
