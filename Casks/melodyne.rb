cask "melodyne" do
  version "5.4.2.006"
  sha256 "88d31b7eadf2a2c6c3eb931ae115706c25df2750c81cfedd76840a6ce0df9327"

  url "https://s3.eu-west-1.amazonaws.com/assets.celemony.com/Demos/Melodyne.#{version}-Demo.dmg",
      verified: "s3.eu-west-1.amazonaws.com/assets.celemony.com/"
  name "Celemony Melodyne 5"
  desc "Pitch and time editing software"
  homepage "https://www.celemony.com/en/trial"

  pkg "Melodyne.#{version}.pkg"

  uninstall quit:    "com.celemony.melodyne.standalone",
            pkgutil: [
              "com.celemony.melodyne.aax",
              "com.celemony.melodyne.au",
              "com.celemony.melodyne.standalone",
              "com.celemony.melodyne.vst3",
            ],
            delete:  [
              "/Applications/Melodyne 5",
              "/Library/Application Support/Celemony/Bundles/MelodyneCore-#{version}.sbb",
              "/Library/Application Support/Celemony/Bundles/MelodyneCoreF-#{version}.sbb",
              "/Library/Application Support/Avid/Audio/Plug-Ins/Melodyne.aaxplugin",
              "/Library/Audio/Plug-Ins/Components/Melodyne.component",
              "/Library/Audio/Plug-Ins/VST3/Melodyne.vst3",
            ]
end
