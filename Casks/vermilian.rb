cask "vermilian" do
  version "1.2.2"
  sha256 "da39f69192eb0569fec899f7183dd14a6e26c2468b975b9ccad4dc6367998dcb"

  url "https://github.com/kevinpinscoe/vermilian/releases/download/v1.2.2/Vermilian-1.2.2-arm64.dmg"
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
