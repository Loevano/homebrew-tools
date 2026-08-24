cask "fabfilter" do
  version "1.0"
  sha256 :no_check

  url "file:///dev/null"
  name "FabFilter"
  desc "FabFilter plug-in cask collection"
  homepage "https://www.fabfilter.com/"

  livecheck do
    skip "Meta cask"
  end

  depends_on cask: "fabfilter-pro-q"
  depends_on cask: "fabfilter-pro-c"
  depends_on cask: "fabfilter-pro-l"
  depends_on cask: "fabfilter-pro-mb"
  depends_on cask: "fabfilter-pro-r"
  depends_on cask: "fabfilter-pro-ds"
  depends_on cask: "fabfilter-pro-g"
  depends_on cask: "fabfilter-saturn"
  depends_on cask: "fabfilter-volcano"
  depends_on cask: "fabfilter-timeless"
end
