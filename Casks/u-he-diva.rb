cask "u-he-diva" do
  version "1.4.8,16519"
  sha256 "83baea58896bb120428c134476ba8602665315384ac1b068bc22d62e4f288189"

  url "https://dl.u-he.com/releases/Diva_#{version.csv.first.no_dots}_#{version.csv.second}_Mac.zip",
      verified: "dl.u-he.com/"
  name "u-he Diva"
  desc "Virtual analogue synthesizer plug-in"
  homepage "https://u-he.com/products/diva/"

  depends_on :macos

  pkg "Diva_#{version.csv.second}_Mac/Diva #{version.csv.first} Installer.pkg"

  uninstall pkgutil: [
              "com.u-he.Diva.aax",
              "com.u-he.Diva.au",
              "com.u-he.Diva.clap",
              "com.u-he.Diva.data.pkg",
              "com.u-he.Diva.documentation.pkg",
              "com.u-he.Diva.engine.pkg",
              "com.u-he.Diva.nks.pkg",
              "com.u-he.Diva.presets.pkg",
              "com.u-he.Diva.tuningFiles.pkg",
              "com.u-he.Diva.vst3",
            ],
            delete:  [
              "/Library/Application Support/Avid/Audio/Plug-Ins/Diva.aaxplugin",
              "/Library/Application Support/Native Instruments/Service Center/u-he-Diva.xml",
              "/Library/Application Support/u-he/Diva",
              "/Library/Audio/Plug-Ins/CLAP/u-he/Diva.clap",
              "/Library/Audio/Plug-Ins/Components/Diva.component",
              "/Library/Audio/Plug-Ins/VST3/Diva.vst3",
              "/Library/Audio/Presets/u-he/Diva",
              "/Library/Documentation/u-he/Diva",
              "/Library/Preferences/com.native-instruments.u-he-Diva.plist",
            ]

  zap trash: [
    "~/Library/Application Support/u-he/Diva",
    "~/Library/Audio/Presets/u-he/Diva",
    "~/Library/Caches/u-he/Diva",
    "~/Library/Preferences/com.u-he.Diva.plist",
  ]
end
