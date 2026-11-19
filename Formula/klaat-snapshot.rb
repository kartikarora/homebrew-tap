class KlaatSnapshot < Formula
  desc "Klaat snapshot build - 2.2.0.51-5acffc3d"
  homepage "https://klaat.kartikarora.me"
  version "2.2.0.51-5acffc3d"

  # Default URL (macOS ARM64) to satisfy Homebrew's static parsing requirement
  url "https://distribute.kartikarora.me/bin/klaat/snapshot/2.2.0.51-5acffc3d/klaat-snapshot-macos-arm64-2.2.0.51-5acffc3d"
  sha256 "70a5acbd2562b7f36b311145c21b46bb8bb115aadc18c3c95bbfcc208f1d8840"

  if OS.linux?
    if Hardware::CPU.arm?
      url "https://distribute.kartikarora.me/bin/klaat/snapshot/2.2.0.51-5acffc3d/klaat-snapshot-linux-arm64-2.2.0.51-5acffc3d"
      sha256 "a7a54b13769166b984e127fb3be9b6f5e8413feea33d01e35b7c624f683528e4"
    elsif Hardware::CPU.intel?
      url "https://distribute.kartikarora.me/bin/klaat/snapshot/2.2.0.51-5acffc3d/klaat-snapshot-linux-x64-2.2.0.51-5acffc3d"
      sha256 "ee21b6f96ccc229d57ef0c74b8923f368e867357be71b00ef561b6713f0c96de"
    end
  end

  def install
    if OS.mac? && Hardware::CPU.intel?
      odie "Klaat only supports Apple Silicon Macs. Intel Macs are not supported."
    end

    bin.install Dir["klaat-*"].first => "klaat-snapshot"
    (bin/"klaat-snapshot").chmod 0555
    generate_completions_from_executable(bin/"klaat-snapshot", "completion")
  end

  test do
    assert_match "klaat", shell_output("#{bin}/klaat-snapshot --help")
  end
end
