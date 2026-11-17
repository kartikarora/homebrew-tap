cask "citadel" do
  version "0.1.0"
  sha256 "919b71da67d498d05a4cdb2061dc7428c25862ae60fd9438a2baf32df05c4a70"

  url "https://github.com/kartikarora/citadel/releases/download/#{version}/Citadel-#{version}-macOS-arm64.dmg"
  name "Citadel"
  desc "Native macOS command center for managing AI coding skills & MCP servers"
  homepage "https://citadel.kartikarora.me/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sonoma

  app "Citadel.app"

  zap trash: [
    "~/Library/Application Support/Citadel",
    "~/Library/Caches/me.kartikarora.Citadel",
    "~/Library/Preferences/me.kartikarora.Citadel.plist",
  ]
end
