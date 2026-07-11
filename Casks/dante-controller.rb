cask "dante-controller" do
  version "4.18.0.11"
  sha256 "e5c1aee5e0a1d594e54b5249a5ab4c34cc1129a8c2828e7fff81645214274070"

  url "https://audinate-software-updates.sgp1.cdn.digitaloceanspaces.com/DanteController/4/4.18/apple_silicon/DanteController-#{version}-macos-arm64.dmg",
      verified: "audinate-software-updates.sgp1.cdn.digitaloceanspaces.com/DanteController/"
  name "Dante Controller"
  desc "Control inputs and outputs on a Dante network"
  homepage "https://www.getdante.com/products/software-essentials/dante-controller/"

  auto_updates true
  depends_on arch: :arm64
  depends_on macos: :big_sur

  pkg "DanteController.pkg"

  uninstall launchctl: [
              "com.audinate.dante.ConMon",
              "com.audinate.dante.DanteUpdateHelper",
            ],
            pkgutil:   [
              "com.audinate.dante.conmon.pkg",
              "com.audinate.dante.pkg.DanteActivator",
              "com.audinate.dante.pkg.DanteActivatorLegacy",
              "com.audinate.dante.pkg.DanteController",
              "com.audinate.dante.pkg.DanteControllerPackage",
              "com.audinate.dante.pkg.DanteUpdateHelper",
              "com.audinate.dante.pkg.DanteUpdateHelperDB",
              "com.audinate.dante.pkg.DanteUpdater",
            ]
end
