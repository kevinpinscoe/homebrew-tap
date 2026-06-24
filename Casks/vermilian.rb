cask "vermilian" do
  version "1.0.0"
  sha256 "db809b86e1de38b740945c24141c8578f02c25e67607c0553ee9faeabf49c1c9"

  url "https://github.com/kevinpinscoe/vermilian/releases/download/v1.0.0/Vermilian-1.0.0-arm64.dmg"
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
