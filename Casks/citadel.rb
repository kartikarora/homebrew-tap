cask "citadel" do
  version "0.1.0"
  sha256 "3a8b0e5345c65c5304da33f7a50f5c117f680ed1dc615105e42905ad0bcbc15e"

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
