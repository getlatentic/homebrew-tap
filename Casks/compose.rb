cask "compose" do
  arch arm: "aarch64", intel: "universal"

  version "0.0.1-alpha.17"
  sha256 arm:   "1ec81aef1b19aef6c1809cf7413f16597adce6ea987892ee76b508824cbd6231",
         intel: "270beaf2e60ee1cdceb85e35c52a8dce862405ad06254fbb09453e32bf13d2c8"

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
