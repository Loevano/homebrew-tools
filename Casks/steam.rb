cask "steam" do
  version "6.0"
  sha256 :no_check

  url "https://cdn.cloudflare.steamstatic.com/client/installer/steam.dmg",
      verified: "cdn.cloudflare.steamstatic.com/"
  name "Steam"
  desc "Video game digital distribution service"
  homepage "https://store.steampowered.com/about/"

  auto_updates true

  app "Steam.app"

  uninstall launchctl: [
              "com.valvesoftware.steam.ipctool",
              "com.valvesoftware.steamclean",
            ],
            quit:      [
              "com.valvesoftware.steam",
              "com.valvesoftware.steam.helper",
              "com.valvesoftware.steam.helper.EH",
            ],
            delete:    "~/Library/Application Support/Steam/Steam.AppBundle"
end
