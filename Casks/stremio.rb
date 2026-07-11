cask "stremio" do
  version "5.1.24"
  sha256 "6bf4cfdab52c373f2610636c10ec19059c1e1659764ce2d3c2a07e1f3cdce483"

  url "https://dl.strem.io/stremio-shell-macos/v#{version}/Stremio_arm64.dmg"
  name "Stremio"
  desc "Open-source media center"
  homepage "https://www.strem.io/"

  auto_updates true
  depends_on arch: :arm64
  depends_on macos: :big_sur

  app "Stremio.app"
end
