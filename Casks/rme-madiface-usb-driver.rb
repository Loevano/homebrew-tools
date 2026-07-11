cask "rme-madiface-usb-driver" do
  version "4.30"
  sha256 "90b9e2dee606cf208683e034998112da5cfca5430b4f558f6ed6076c4ef52dca"

  url "https://rme-audio.de/downloads/driver_usbdk_mac_#{version.no_dots}.zip"
  name "RME MADIface USB Driver"
  desc "RME USB Series DriverKit driver for MADIface USB and related interfaces"
  homepage "https://rme-audio.de/downloads.html"

  depends_on macos: :big_sur

  pkg "Fireface USB DK #{version.no_dots}.pkg"

  uninstall quit:    [
              "de.rme-audio.RMEfirefaceUSBSettings",
              "de.rme-audio.TotalmixFX",
            ],
            pkgutil: "de.rme-audio.firefaceusbdkdriver.installer",
            delete:  [
              "/Applications/Fireface USB Settings.app",
              "/Applications/Totalmix.app",
              "/Library/Audio/MIDI Drivers/MADIfaceUSB3MIDIDriver.plugin",
              "/Library/Audio/Plug-Ins/HAL/RMEUsbAsp.driver",
              "/Library/LaunchAgents/de.rme-audio.RMEfirefaceUSBAgent.plist",
            ]

  caveats do
    reboot
  end
end
