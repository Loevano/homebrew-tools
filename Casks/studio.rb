cask "studio" do
  version "1.0"
  sha256 :no_check

  url "file:///dev/null"
  name "Studio"
  desc "Studio MacBook cask collection"
  homepage "https://github.com/Loevano/homebrew-tools"

  livecheck do
    skip "Meta cask"
  end

  depends_on cask: "loevano/tools/live"
  depends_on cask: "loevano/tools/dropbox"
  depends_on cask: "loevano/tools/melodyne"
  depends_on cask: "loevano/tools/microsoft-teams"
  depends_on cask: "loevano/tools/room-eq-wizard"
end
