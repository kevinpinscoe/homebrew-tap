cask "vermilian" do
  version "1.3.0"
  sha256 "b92ef147f01868b5943582bb0fd890c7c21c1fd3f575d3110715b7acfb3bf6b8"

  url "https://github.com/kevinpinscoe/vermilian/releases/download/v1.3.0/Vermilian-1.3.0-arm64.dmg"
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
