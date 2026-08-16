# Loevano Homebrew Tools

Personal Homebrew tap for macOS apps, audio drivers, utilities, and audio plugin installers.

## Using This Tap

Add the tap:

```sh
brew tap loevano/tools https://github.com/Loevano/homebrew-tools
brew trust loevano/tools
```

Install a cask:

```sh
brew install --cask loevano/tools/room-eq-wizard
```

Update tap definitions and upgrade installed casks:

```sh
brew update
brew upgrade --cask
```

List casks from this tap:

```sh
brew search --casks loevano/tools/
```

## Repo Layout

```text
homebrew-tools/
  Casks/
    room-eq-wizard.rb
    totalmix-fx.rb
  README.md
```

Each cask lives in `Casks/<token>.rb`.

The token should be lowercase and hyphenated:

```texto
Room EQ Wizard      -> room-eq-wizard
RME TotalMix FX     -> totalmix-fx
Dante Controller    -> dante-controller
```

## Add A New Cask

Use official vendor download URLs whenever possible. Avoid random mirrors, shortlinks, and URLs that require an authenticated browser session.

1. Create a cask file:

```sh
cd ~/Documents/Coding/homebrew-tools
touch Casks/example-app.rb
```

2. Download the installer to `/tmp`:

```sh
curl -L -o /tmp/example-app.dmg "https://example.com/downloads/ExampleApp-1.2.3.dmg"
```

3. Compute the checksum:

```sh
shasum -a 256 /tmp/example-app.dmg
```

4. Inspect the installer contents.

For a DMG:

```sh
hdiutil attach -nobrowse -readonly -mountpoint /tmp/example-dmg /tmp/example-app.dmg
find /tmp/example-dmg -maxdepth 2 -print
hdiutil detach /tmp/example-dmg
```

For a ZIP:

```sh
unzip -l /tmp/example-app.zip
```

For a PKG:

```sh
pkgutil --payload-files /tmp/example-app.pkg | head -100
pkgutil --expand /tmp/example-app.pkg /tmp/example-pkg-expanded
find /tmp/example-pkg-expanded -name PackageInfo -print -exec sed -n '1,120p' {} \;
```

5. Write the cask.

App-in-DMG example:

```ruby
cask "example-app" do
  version "1.2.3"
  sha256 "PUT_SHA256_HERE"

  url "https://example.com/downloads/ExampleApp-#{version}.dmg"
  name "Example App"
  desc "Short description of the app"
  homepage "https://example.com/"

  app "Example App.app"

  uninstall quit: "com.example.app"
end
```

PKG example:

```ruby
cask "example-driver" do
  version "1.2.3"
  sha256 "PUT_SHA256_HERE"

  url "https://example.com/downloads/ExampleDriver-#{version}.pkg"
  name "Example Driver"
  desc "Short description of the driver"
  homepage "https://example.com/"

  pkg "ExampleDriver-#{version}.pkg"

  uninstall pkgutil: "com.example.driver"

  caveats do
    reboot
  end
end
```

Installer-app example:

```ruby
cask "example-installer" do
  version "1.2.3"
  sha256 "PUT_SHA256_HERE"

  url "https://example.com/downloads/ExampleInstaller-#{version}.dmg"
  name "Example Installer"
  desc "Short description of the installer"
  homepage "https://example.com/"

  installer script: {
    executable: "Example Installer.app/Contents/MacOS/Example Installer",
    args:       ["--quiet"],
    sudo:       true,
  }

  uninstall delete: "/Applications/Example"
end
```

6. Test without installing:

```sh
brew info --cask loevano/tools/example-app
```

7. Install and uninstall test if safe:

```sh
brew install --cask loevano/tools/example-app
brew uninstall --cask loevano/tools/example-app
```

8. Commit and push:

```sh
git add Casks/example-app.rb
git commit -m "Add Example App cask"
git push
```

## Livecheck

Homebrew calls this a `livecheck` block. It checks upstream for newer versions, but it does not rewrite the cask or update the SHA-256 for you.

Run livecheck for one cask:

```sh
brew livecheck --cask loevano/tools/totalmix-fx
```

Run livecheck for this whole tap:

```sh
brew livecheck --cask --tap loevano/tools
```

Simple livecheck example:

```ruby
livecheck do
  url "https://example.com/downloads/"
  regex(/Example[._-]App[._-]v?(\d+(?:\.\d+)+)\.dmg/i)
end
```

Use this when the page contains filenames like:

```text
Example-App-1.2.3.dmg
Example_App_v1.2.3.dmg
```

Direct URL livecheck example:

```ruby
livecheck do
  url :url
  regex(/ExampleApp[._-]v?(\d+(?:\.\d+)+)\.dmg/i)
end
```

Use this when the cask `url` itself contains the version.

Multi-part version example:

```ruby
cask "totalmix-fx" do
  version "2.03,1.991"

  url "https://rme-audio.de/downloads/tmfx_#{version.csv.first.no_dots}_#{version.csv.second.no_dots}_mac.zip"

  livecheck do
    url "https://rme-audio.de/downloads.html"
    regex(/tmfx[._-](\d+)[._-](\d+)[._-]mac\.zip/i)
    strategy :page_match do |page, regex|
      page.scan(regex).map do |main, legacy|
        [main, legacy].map { |part| "#{part[0]}.#{part[1..]}" }.join(",")
      end
    end
  end
end
```

This turns a filename like:

```text
tmfx_203_1991_mac.zip
```

into:

```text
2.03,1.991
```

## Updating A Cask After Livecheck Finds A New Version

Livecheck only tells you a newer version exists. To update the cask:

1. Download the new installer.
2. Compute the new SHA-256.
3. Update `version`, `sha256`, and any URL/package names in the cask.
4. Run `brew info --cask loevano/tools/<token>`.
5. Commit and push.

Example:

```sh
curl -L -o /tmp/example-app-1.2.4.dmg "https://example.com/downloads/ExampleApp-1.2.4.dmg"
shasum -a 256 /tmp/example-app-1.2.4.dmg
```

Then edit:

```ruby
version "1.2.4"
sha256 "NEW_SHA256_HERE"
```

Commit:

```sh
git add Casks/example-app.rb
git commit -m "Update Example App to 1.2.4"
git push
```

## Manager Casks And Meta Casks

A manager cask installs the vendor's installer/updater app:

```text
arturia-software-center
native-access
kilohearts-installer
```

Use manager casks when downloads are account-gated, license-gated, or controlled by the vendor's own app.

A meta cask groups other casks together:

```ruby
cask "studio-plugin-managers" do
  version "1.0"
  sha256 :no_check

  url "file:///dev/null"
  name "Studio Plugin Managers"
  desc "Collection of plugin manager casks"
  homepage "https://github.com/Loevano/homebrew-tools"

  depends_on cask: "loevano/tools/arturia-software-center"
  depends_on cask: "loevano/tools/native-access"
  depends_on cask: "loevano/tools/kilohearts-installer"
end
```

Meta casks can depend on other meta casks. Avoid circular dependencies.

## Notes

- Prefer official vendor URLs.
- Prefer exact SHA-256 checksums over `sha256 :no_check`.
- Use `sha256 :no_check` only for stable "latest" URLs where the file changes without a versioned URL.
- Use `pkgutil --payload-files` and `pkgutil --expand` before writing `pkg` and `uninstall pkgutil:` stanzas.
- Do not commit downloaded installers into this repo.
- Keep unrelated cask changes in separate commits.
