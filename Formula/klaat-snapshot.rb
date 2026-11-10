class KlaatSnapshot < Formula
  desc "Klaat snapshot build - 2.1.0.47-6a3be6f9"
  homepage "https://klaat.kartikarora.me"
  version "2.1.0.47-6a3be6f9"

  # Default URL (macOS ARM64) to satisfy Homebrew's static parsing requirement
  url "https://distribute.kartikarora.me/bin/klaat/snapshot/2.1.0.47-6a3be6f9/klaat-snapshot-macos-arm64-2.1.0.47-6a3be6f9"
  sha256 "526105bab5ae49b1d0d5427329b8ae46b8138f74904820e422c46a9239e2d0a4"

  if OS.linux?
    if Hardware::CPU.arm?
      url "https://distribute.kartikarora.me/bin/klaat/snapshot/2.1.0.47-6a3be6f9/klaat-snapshot-linux-arm64-2.1.0.47-6a3be6f9"
      sha256 "03de58894481b469947c98de28f66842a92cbb8c980fa238786ba98e99ca67b5"
    elsif Hardware::CPU.intel?
      url "https://distribute.kartikarora.me/bin/klaat/snapshot/2.1.0.47-6a3be6f9/klaat-snapshot-linux-x64-2.1.0.47-6a3be6f9"
      sha256 "5777491c34159f531ad524b77736e17351f77bf67c7828ed746dda9fa0572d66"
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
