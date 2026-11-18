class KlaatSnapshot < Formula
  desc "Klaat snapshot build - 2.2.0.49-ebcf5fe5"
  homepage "https://klaat.kartikarora.me"
  version "2.2.0.49-ebcf5fe5"

  # Default URL (macOS ARM64) to satisfy Homebrew's static parsing requirement
  url "https://distribute.kartikarora.me/bin/klaat/snapshot/2.2.0.49-ebcf5fe5/klaat-snapshot-macos-arm64-2.2.0.49-ebcf5fe5"
  sha256 "394b3dae20852d30b27506abd3cadd70f43361d009262c596430dac185ae7cda"

  if OS.linux?
    if Hardware::CPU.arm?
      url "https://distribute.kartikarora.me/bin/klaat/snapshot/2.2.0.49-ebcf5fe5/klaat-snapshot-linux-arm64-2.2.0.49-ebcf5fe5"
      sha256 "31a052bd71cd3592a7d7a6b1fb8c1c7f244d5dce569037d61cae02f17808710c"
    elsif Hardware::CPU.intel?
      url "https://distribute.kartikarora.me/bin/klaat/snapshot/2.2.0.49-ebcf5fe5/klaat-snapshot-linux-x64-2.2.0.49-ebcf5fe5"
      sha256 "df289a2590a4e4f6d648d7a1dd139ffbc67da6afd12d61b96beafb26a90dc19c"
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
