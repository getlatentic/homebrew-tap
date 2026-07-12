cask "compose" do
  arch arm: "aarch64", intel: "universal"

  version "0.0.1-alpha.9"
  sha256 arm:   "e48ef0768b03c5d080f1ad398c1fa066b0dc6ab516bcc16b649b83bf76be89fd",
         intel: "6f3118be287a485e7ba5dea9c67c20122a0b45ba5de3eb751181ca265ffe40f2"

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
