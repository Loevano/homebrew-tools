cask "touchosc" do
  version "1.5.2,262"
  sha256 "d6574fde38d530da27abc0eaa2da56ae9633176c7b7e825d709cc5b638ba9e16"

  url "https://hexler.net/pub/touchosc/touchosc-#{version.csv.first}.#{version.csv.second}-macos.dmg"
  name "TouchOSC"
  desc "MIDI and OSC controller software"
  homepage "https://hexler.net/touchosc"

  auto_updates true

  app "TouchOSC.app"
end
