cask "ilok-license-manager" do
  version "6.0.0"
  sha256 :no_check

  url "https://installers.ilok.com/iloklicensemanager/LicenseSupportInstallerMac.zip"
  name "iLok License Manager"
  desc "Software for iLok devices"
  homepage "https://ilok.com/#!license-manager"

  pkg "License Support.pkg"

  uninstall launchctl: [
              "com.paceap.eden.licensed",
              "com.paceap.eden.licensed.agent",
            ],
            pkgutil:   [
              "com.paceap.pkg.eden.activationexperience",
              "com.paceap.pkg.eden.iLokLicenseManager",
              "com.paceap.pkg.eden.licensed",
            ],
            delete:    "/usr/local/bin/iloktool"
end
