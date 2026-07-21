# frozen_string_literal: true

class MenuApp < Formula
  desc "Run repository scripts from a simple TUI menu"
  homepage "https://github.com/kevinpinscoe/tools"
  version "2.0.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kevinpinscoe/tools/releases/download/menu-app-v2.0.0/menu-app-darwin-arm64"
      sha256 "96036f3c37350a4e78a065cd0268f0ed65d468f0a195ec471cda4b158a73c707"

      define_method(:install) do
        bin.install "menu-app-darwin-arm64" => "menu-app"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/kevinpinscoe/tools/releases/download/menu-app-v2.0.0/menu-app-linux-amd64"
      sha256 "8b73adc4269548ad63765be5137b2d7db1309a924ab6f94333ed8bbd65dc6879"
      define_method(:install) do
        bin.install "menu-app-linux-amd64" => "menu-app"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/kevinpinscoe/tools/releases/download/menu-app-v2.0.0/menu-app-linux-arm64"
      sha256 "5e8fc52978920629efe606cbdb7e92d70e678ee4d9dff6f3ad20ba7b2c389767"
      define_method(:install) do
        bin.install "menu-app-linux-arm64" => "menu-app"
      end
    end
  end

  test do
    system "#{bin}/menu-app", "--help"
  end
end
