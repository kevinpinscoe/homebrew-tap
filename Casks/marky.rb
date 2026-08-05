cask "marky" do
  version "0.1.3"
  sha256 "b110d515b073653c6ef07f7966dbac86448ed00d127fcff76591402b1481086a"

  url "https://github.com/kevinpinscoe/marky/releases/download/personal-v0.1.3/Marky-0.1.3-arm64.dmg"
  name "Marky"
  desc "Apostrophe-inspired Markdown editor built with Electron, React, and TypeScript"
  homepage "https://github.com/kevinpinscoe/marky"

  depends_on arch: :arm64

  # Unsigned build — remove the quarantine attribute so Gatekeeper allows launch.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Marky.app"],
                   sudo: false
  end

  app "Marky.app"

  zap trash: [
    "~/Library/Application Support/Marky",
    "~/Library/Preferences/com.marky.app.plist",
    "~/Library/Saved Application State/com.marky.app.savedState",
  ]
end
