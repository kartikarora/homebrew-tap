class Citadel < Formula
  desc "Command-line tool for Citadel AI skill & MCP manager"
  homepage "https://citadel.kartikarora.me/"
  version "0.1.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/kartikarora/citadel/releases/download/0.1.0/citadel-0.1.0-macOS-arm64.tar.gz"
    sha256 "3f80140c19ca046d56b0b2057f7cb9371ec5a744f6c904f34ecb363309769bde"
  end

  def install
    bin.install "citadel"
    bin.install_symlink bin/"citadel" => "ctdl"

    # Install completions
    generate_completions_from_executable(bin/"citadel", "--generate-completion-script") if build.with? "completions"
  end

  test do
    system "#{bin}/citadel", "--version"
  end
end
