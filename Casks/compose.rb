cask "compose" do
  arch arm: "aarch64", intel: "universal"

  version "0.0.1-alpha.10"
  sha256 arm:   "8beccffe5f718a6b275ad076021e7c15248022e97f41c442a75e2c47ffeea9b6",
         intel: "3016aba3c94f3c328e60624d6374f2a968f20debaed7e86d0a26f292e96ca86f"

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
