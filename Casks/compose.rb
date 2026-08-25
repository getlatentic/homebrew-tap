cask "compose" do
  arch arm: "aarch64", intel: "universal"

  version "0.0.1-alpha.13"
  sha256 arm:   "3074e09d7998e23bcea7e6a4b89820c9b7b67fca7d2bac8d68098cc8d33f19e7",
         intel: "1c03398a59c9a825acbd23d697ffa4ccb18ab7e696b95ea771e19e67bf838e02"

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
