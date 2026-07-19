cask "compose" do
  arch arm: "aarch64", intel: "universal"

  version "0.0.1-alpha.12"
  sha256 arm:   "8f79606415f551e46929c8ef9b3ac5c1f79ff00659f5757adf8a49cc1f7f06c1",
         intel: "0437e5b829b5390d7e5012305f197ff9162b618a275d95a37964a7e4315d55ef"

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
