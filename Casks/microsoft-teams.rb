cask "microsoft-teams" do
  version "26163.407.4839.8659"
  sha256 "ea55e7b683cf606f1642597f35441068dd553db1cafa827927c3f7a04e57b980"

  url "https://statics.teams.cdn.office.net/production-osx/#{version}/MicrosoftTeams.pkg",
      verified: "statics.teams.cdn.office.net/production-osx/"
  name "Microsoft Teams"
  desc "Meet, chat, call, and collaborate in one place"
  homepage "https://www.microsoft.com/en/microsoft-teams/group-chat-software/"

  auto_updates true
  depends_on macos: :sonoma

  pkg "MicrosoftTeams.pkg"

  uninstall launchctl: "com.microsoft.teams.TeamsUpdaterDaemon",
            quit:      "com.microsoft.autoupdate2",
            pkgutil:   [
              "com.microsoft.MSTeamsAudioDevice",
              "com.microsoft.teams2",
            ],
            delete:    [
              "/Applications/Microsoft Teams.app",
              "/Library/Application Support/Microsoft/TeamsUpdaterDaemon",
              "/Library/Logs/Microsoft/MSTeams",
              "/Library/Logs/Microsoft/Teams",
              "/Library/Preferences/com.microsoft.teams.plist",
            ]
end
