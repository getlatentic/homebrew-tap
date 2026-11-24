cask "compose" do
  arch arm: "aarch64", intel: "universal"

  version "0.0.1-alpha.24"
  sha256 arm:   "e2c6482c56cab01ba7138d776f7b2ea34b98c705c428cc9f400889aa019e5c9f",
         intel: "07a23a5a01c858ba4d1b8096f77dd4ea8de70d0bbdf9358dc1f1fcdd7a47c3e6"

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
