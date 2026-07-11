cask "totalmix-fx" do
  version "2.03,1.991"
  sha256 "c1a790ab902f76afd85bd37fa63ae0bdd86bb6554100c696ac0a401edd926dc1"

  url "https://rme-audio.de/downloads/tmfx_#{version.csv.first.no_dots}_#{version.csv.second.no_dots}_mac.zip"
  name "RME TotalMix FX"
  desc "Mixer and routing software for RME audio interfaces"
  homepage "https://rme-audio.de/downloads.html"

  pkg "TMInstaller_#{version.csv.first.no_dots}.pkg"

  uninstall quit:    "de.rme-audio.TotalmixFX",
            pkgutil: "de.rme-audio.TotalmixFX",
            delete:  "/Applications/Totalmix.app"
end
