class Citadel < Formula
  desc "Command-line tool for Citadel AI skill & MCP manager"
  homepage "https://citadel.kartikarora.me/"
  version "0.1.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/kartikarora/citadel/releases/download/#{version}/citadel-#{version}-macOS-arm64.tar.gz"
    sha256 "041b6904e3d88678448d32e36ee2d6282c442f3f8f3509de1601597a119ee261"
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
