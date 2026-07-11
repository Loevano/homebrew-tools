cask "pigments" do
  version "7.0.0.6447"
  sha256 "1a2c20cc542924b739212173b5da3ee249c2e114ad4d3ca03bd8fcfc891db17f"

  url "https://dl.arturia.net/products/pigments/soft/Pigments__#{version.dots_to_underscores}.pkg",
      verified: "dl.arturia.net/"
  name "Arturia Pigments"
  desc "Sound design software synthesizer"
  homepage "https://www.arturia.com/products/software-instruments/pigments/overview"

  depends_on cask: "arturia-software-center"
  depends_on :macos

  pkg "Pigments__#{version.dots_to_underscores}.pkg"

  uninstall quit:    "com.Arturia.Pigments",
            pkgutil: [
              "com.Arturia.Pigments.aax",
              "com.Arturia.Pigments.asc",
              "com.Arturia.Pigments.au",
              "com.Arturia.Pigments.common_vc8",
              "com.Arturia.Pigments.images",
              "com.Arturia.Pigments.nks",
              "com.Arturia.Pigments.resources",
              "com.Arturia.Pigments.samples",
              "com.Arturia.Pigments.standalone",
              "com.Arturia.Pigments.vst2",
              "com.Arturia.Pigments.vst3",
            ],
            delete:  [
              "/Applications/Arturia/Pigments.app",
              "/Library/Application Support/Avid/Audio/Plug-Ins/Arturia/Pigments.aaxplugin",
              "/Library/Arturia/Pigments",
              "/Library/Arturia/Presets/Pigments",
              "/Library/Arturia/Samples/Pigments",
              "/Library/Audio/Plug-Ins/Components/Pigments.component",
              "/Library/Audio/Plug-Ins/VST/Pigments.vst",
              "/Library/Audio/Plug-Ins/VST3/Pigments.vst3",
            ]

  zap trash: [
    "~/Library/Arturia/Pigments",
    "~/Library/Caches/com.Arturia.Pigments",
    "~/Library/Preferences/com.Arturia.Pigments.plist",
  ]
end
