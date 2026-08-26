cask "compose" do
  arch arm: "aarch64", intel: "universal"

  version "0.0.1-alpha.15"
  sha256 arm:   "ec6d259c448173f495f3e1a60d48ffd6c0145845660ecafcfbf065e93f2f776f",
         intel: "7a875b1cf69cc51cd107116577fae07c6bdf5f329e839b9ddabd6015ecc26361"

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
