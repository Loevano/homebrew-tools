cask "arturia-software-center" do
  version "2.12.0.3157"
  sha256 "a164c345c6c916179a3ff4c04fd3380dd41ad08f72c1fc3cc6ff66026e35871f"

  url "https://dl.arturia.net/products/asc/soft/Arturia_Software_Center__2_12_0_3157.pkg",
      verified: "dl.arturia.net/"
  name "Arturia Software Center"
  desc "Installer and license activation for Arturia products"
  homepage "https://www.arturia.com/technology/asc"

  auto_updates true

  pkg "Arturia_Software_Center__2_12_0_3157.pkg"

  uninstall launchctl: "com.Arturia.ArturiaSoftwareCenterAgent",
            pkgutil:   [
              "com.Arturia.ArturiaSoftwareCenter.fonts",
              "com.Arturia.ArturiaSoftwareCenter.resources",
            ]
end
