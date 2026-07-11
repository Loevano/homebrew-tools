cask "companion" do
  version "4.3.4,9244,c14e5e3334"
  sha256 "4673efbbdb0383c3cdee981f5832bd823ab55c1fc0b2a8e1fbdc5bdd27eeab66"

  url "https://cf-pub.bitfocus.io/companion/companion/companion-mac-arm64-#{version.csv.first}-#{version.csv.second}-stable-#{version.csv.third}.dmg"
  name "Bitfocus Companion"
  desc "Streamdeck extension and emulation software"
  homepage "https://bitfocus.io/companion"

  depends_on arch: :arm64
  depends_on macos: :monterey

  app "Companion.app"
end
