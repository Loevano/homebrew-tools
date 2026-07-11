cask "ableton-live-suite" do
  version "12.4.2"
  sha256 "d7129207e71cb3480cb7f6f1d654ccdf38b6cf37de545f505224f063ce86545e"

  url "https://cdn-downloads.ableton.com/channels/#{version}/ableton_live_suite_#{version}_universal.dmg"
  name "Ableton Live Suite"
  desc "Sound and music editor"
  homepage "https://www.ableton.com/en/live/"

  auto_updates true
  depends_on macos: ">= :big_sur"

  app "Ableton Live 12 Suite.app"

  uninstall quit: "com.ableton.live"
end
