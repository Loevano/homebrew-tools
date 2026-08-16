cask "personal-macbook" do
  version "1.0"
  sha256 :no_check

  url "file:///dev/null"
  name "Personal MacBook"
  desc "Apps for a personal MacBook"
  homepage "https://github.com/Loevano/homebrew-tools"

  livecheck do
    skip "Meta cask"
  end

  depends_on cask: "visual-studio-code"
  depends_on cask: "whatsapp"
  depends_on cask: "loevano/tools/dropbox"
  depends_on cask: "loevano/tools/brave-browser"
  depends_on cask: "loevano/tools/fabfilter"
  depends_on cask: "loevano/tools/ableton-live-suite"
  depends_on cask: "reaper"
end
