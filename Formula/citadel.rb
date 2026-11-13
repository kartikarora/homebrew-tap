class Citadel < Formula
  desc "Command-line tool for Citadel AI skill & MCP manager"
  homepage "https://citadel.kartikarora.me/"
  version "0.1.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/kartikarora/citadel/releases/download/0.1.0/citadel-0.1.0-macOS-arm64.tar.gz"
    sha256 "4444037d05886264c62abddc164b90a3ce3d5cf2329385c6dc57314131a5e27a"
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
