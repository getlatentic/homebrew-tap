cask "compose" do
  arch arm: "aarch64", intel: "universal"

  version "0.0.1-alpha.11"
  sha256 arm:   "e13a44bea994312ee9445c173f47f2ce18be27603943d0224088ed6583176329",
         intel: "c7f6800b0527c1056770d4495504f106cefb9d2c92e9cede85a6b2a3f7520fda"

  url "https://github.com/getlatentic/compose/releases/download/v#{version}/Compose_#{version}_#{arch}.dmg"
  name "Compose"
  desc "Local-first AI Markdown editor — agents edit your documents with review and undo"
  homepage "https://github.com/getlatentic/compose"

  livecheck do
    url :url
    strategy :github_latest
  end

  # The app updates itself (Tauri updater); brew shouldn't flag it outdated.
  auto_updates true

  app "Compose.app"

  zap trash: [
    "~/Library/Application Support/ai.latentic.compose",
    "~/Library/Caches/ai.latentic.compose",
    "~/Library/WebKit/ai.latentic.compose",
    "~/Library/Preferences/ai.latentic.compose.plist",
    "~/Library/Saved Application State/ai.latentic.compose.savedState",
  ]
end
