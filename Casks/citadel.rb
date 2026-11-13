cask "citadel" do
  version "0.1.0"
  sha256 "06ae186da2455d7c65224333e1f20eb8a8d33b80c678d82b5de9584996492b7c"

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
