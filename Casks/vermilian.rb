cask "vermilian" do
  version "1.0.1"
  sha256 "1879c577a4d3d4f3b25af89254fbf094bb28325a74e824ee675641b123e7500e"

  url "https://github.com/kevinpinscoe/vermilian/releases/download/v1.0.1/Vermilian-1.0.1-arm64.dmg"
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
