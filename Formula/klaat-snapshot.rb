class KlaatSnapshot < Formula
  desc "Klaat snapshot build - 2.1.0.48-8de86263"
  homepage "https://klaat.kartikarora.me"
  version "2.1.0.48-8de86263"

  # Default URL (macOS ARM64) to satisfy Homebrew's static parsing requirement
  url "https://distribute.kartikarora.me/bin/klaat/snapshot/2.1.0.48-8de86263/klaat-snapshot-macos-arm64-2.1.0.48-8de86263"
  sha256 "908425bb528475af945ea33d2fc8d11d24df29dae8b2e1f736c76bf4fed3cb30"

  if OS.linux?
    if Hardware::CPU.arm?
      url "https://distribute.kartikarora.me/bin/klaat/snapshot/2.1.0.48-8de86263/klaat-snapshot-linux-arm64-2.1.0.48-8de86263"
      sha256 "78599b10f172d5b003bb12822ddf49a292880b102a92bdb383d0d6ed58162c11"
    elsif Hardware::CPU.intel?
      url "https://distribute.kartikarora.me/bin/klaat/snapshot/2.1.0.48-8de86263/klaat-snapshot-linux-x64-2.1.0.48-8de86263"
      sha256 "b6ea864e0637d56ed68c1cc084f6846f042bca5a5a6009df6d25e505183f2b4f"
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
