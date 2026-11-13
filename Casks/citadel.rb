cask "citadel" do
  version "0.1.0"
  sha256 "bca57643dd9b70348527f39631d14999b8d0f6bf5bb5ea9bbf499fd5945a5cb6"

  url "https://github.com/kartikarora/citadel/releases/download/0.1.0/Citadel-#{version}-macOS-arm64.dmg",
      verified: "github.com/kartikarora/citadel/"
  name "Citadel"
  desc "Native macOS command center for managing AI coding skills & MCP servers"
  homepage "https://citadel.kartikarora.me/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :sonoma"

  app "Citadel.app"

  zap trash: [
    "~/Library/Application Support/Citadel",
    "~/Library/Caches/me.kartikarora.Citadel",
    "~/Library/Preferences/me.kartikarora.Citadel.plist",
  ]
end
