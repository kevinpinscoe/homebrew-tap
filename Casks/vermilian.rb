cask "vermilian" do
  version "1.2.3"
  sha256 "1bc2f0e486a3f40257b83a4f158b4e49d14ca56295566c4f0a8bdbb869268a9a"

  url "https://github.com/kevinpinscoe/vermilian/releases/download/v1.2.3/Vermilian-1.2.3-arm64.dmg"
  name "Vermilian"
  desc "monday.com-style desktop client for self-hosted JetBrains YouTrack"
  homepage "https://github.com/kevinpinscoe/vermilian"

  depends_on arch: :arm64

  # Unsigned build — remove the quarantine attribute so Gatekeeper allows launch.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Vermilian.app"],
                   sudo: false
  end

  app "Vermilian.app"

  zap trash: [
    "~/Library/Application Support/Vermilian",
    "~/Library/Preferences/com.electron.vermilian.plist",
    "~/Library/Saved Application State/com.electron.vermilian.savedState",
  ]
end
