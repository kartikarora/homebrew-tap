class Citadel < Formula
  desc "Command-line tool for Citadel AI skill & MCP manager"
  homepage "https://citadel.kartikarora.me/"
  version "0.1.1"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/kartikarora/citadel/releases/download/#{version}/citadel-#{version}-macOS-arm64.tar.gz"
    sha256 "a1e06831b755c0051d38a8eeb159519fe8c2070ec7539e2ef14c6ecac1f82e29"
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
