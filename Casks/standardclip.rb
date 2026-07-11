cask "standardclip" do
  version "1.6.056"
  sha256 "138fe5742b8b32a4c879334b2eebaa84c83eeb0d246d29b63ffa9c38f2a4c941"

  url "https://www.siraudiotools.com/downloadFile.php/StandardCLIP_Mac_#{version}_FullVersion.dmg?product=standardclip&type=downloadFileMacProduct",
      verified: "siraudiotools.com/"
  name "SIR Audio Tools StandardCLIP"
  desc "Clipper plug-in"
  homepage "https://www.siraudiotools.com/StandardCLIP.php"

  depends_on :macos

  pkg "StandardCLIP_Setup_#{version}_FullVersion.pkg"

  uninstall pkgutil: "com.siraudiotools.PluginSetup",
            delete:  [
              "/Library/Application Support/Avid/Audio/Plug-Ins/SIR Audio Tools/StandardCLIP.aaxplugin",
              "/Library/Application Support/Avid/Audio/Plug-Ins/StandardCLIP.aaxplugin",
              "/Library/Audio/Plug-Ins/Components/StandardCLIP.component",
              "/Library/Audio/Plug-Ins/VST/SIR Audio Tools/StandardCLIP.vst",
              "/Library/Audio/Plug-Ins/VST/StandardCLIP.vst",
              "/Library/Audio/Plug-Ins/VST3/SIR Audio Tools/StandardCLIP.vst3",
              "/Library/Audio/Plug-Ins/VST3/StandardCLIP.vst3",
            ],
            rmdir:   [
              "/Library/Application Support/Avid/Audio/Plug-Ins/SIR Audio Tools",
              "/Library/Audio/Plug-Ins/VST/SIR Audio Tools",
              "/Library/Audio/Plug-Ins/VST3/SIR Audio Tools",
            ]

  zap trash: [
    "~/Library/Application Support/SIR Audio Tools/StandardCLIP",
    "~/Library/Caches/com.siraudiotools.StandardCLIP",
    "~/Library/Preferences/com.siraudiotools.StandardCLIP.plist",
  ]
end
