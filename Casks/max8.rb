cask "max8" do
  version "8.6.5,241008"
  sha256 :no_check

  url "https://downloads.cdn.cycling74.com/max8/Max#{version.csv.first.no_dots}_#{version.csv.second}.dmg"
  name "Cycling '74 Max 8"
  desc "Visual programming environment for music and multimedia"
  homepage "https://cycling74.com/downloads/older"

  app "Max.app", target: "Max 8.app"
end
