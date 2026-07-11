cask "dante-virtual-soundcard" do
  version "4.5.2.3"
  sha256 "8d23b26a1b8b6601f4c5dc370bfcfea7558ec18c297992306830d0205d571a1c"

  url "https://audinate-software-updates.sgp1.cdn.digitaloceanspaces.com/DanteVirtualSoundcard/4/4.5/macOS/DVS-#{version}_macos.dmg",
      verified: "audinate-software-updates.sgp1.cdn.digitaloceanspaces.com/DanteVirtualSoundcard/"
  name "Dante Virtual Soundcard"
  desc "Use your Mac as a Dante-enabled audio device"
  homepage "https://www.getdante.com/products/software-essentials/dante-virtual-soundcard/"

  pkg "DanteVirtualSoundcard.pkg"

  uninstall quit:    "com.audinate.DanteVirtualSoundcard",
            pkgutil: [
              "com.audinate.dante.pkg.dvs.DanteVirtualSoundcard",
              "com.audinate.dante.pkg.dvs.ui",
            ],
            delete:  [
              "/Applications/Dante Virtual Soundcard.app",
              "/Applications/Uninstall DVS.app",
            ]
end
