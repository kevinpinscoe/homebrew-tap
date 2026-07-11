# frozen_string_literal: true

class MenuApp < Formula
  desc "Run repository scripts from a simple TUI menu"
  homepage "https://github.com/kevinpinscoe/tools"
  version "1.0.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kevinpinscoe/tools/releases/download/menu-app-v1.0.2/menu-app-darwin-arm64"
      sha256 "9ad1acde4690dc14bed3b6bac7a06d7ae59475aa7f4903de39bc64a452167413"

      define_method(:install) do
        bin.install "menu-app-darwin-arm64" => "menu-app"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/kevinpinscoe/tools/releases/download/menu-app-v1.0.2/menu-app-linux-amd64"
      sha256 "b45df5977b2c061f1fd37b5a7b81d151d542bfee2a903dbfc66138682fc1e336"
      define_method(:install) do
        bin.install "menu-app-linux-amd64" => "menu-app"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/kevinpinscoe/tools/releases/download/menu-app-v1.0.2/menu-app-linux-arm64"
      sha256 "53594f8bb46e94720030e35f3fd309ec8e036b1a5dee5199b1cfe70b06e0028a"
      define_method(:install) do
        bin.install "menu-app-linux-arm64" => "menu-app"
      end
    end
  end

  test do
    system "#{bin}/menu-app", "--help"
  end
end
