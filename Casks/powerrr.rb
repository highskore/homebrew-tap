# Homebrew cask for Powerrr. It lives in the tap repo highskore/homebrew-tap as Casks/powerrr.rb, so:
#   brew install --cask highskore/tap/powerrr
# packaging/bump-cask.sh fills in version and sha256 from a published release.
cask "powerrr" do
  version "0.1.1"
  sha256 "ebbedf5c5140e0559ee9b0158925129e13df3d01436b4c93e66ebf2677bbc179"

  url "https://github.com/highskore/powerrr/releases/download/desktop-v#{version}/Powerrr_#{version}_universal.dmg"
  name "Powerrr"
  desc "Idle Dragon Ball planet game as a desktop widget"
  homepage "https://github.com/highskore/powerrr"

  livecheck do
    url :url
    regex(/^desktop-v(\d+(?:\.\d+)+)$/i)
    strategy :github_latest
  end

  depends_on macos: ">= :big_sur"

  app "Powerrr.app"

  uninstall quit: "com.highskore.powerrr"

  zap trash: [
    "~/Library/Application Support/com.highskore.powerrr",
    "~/Library/Caches/com.highskore.powerrr",
    "~/Library/LaunchAgents/Powerrr.plist",
    "~/Library/Preferences/com.highskore.powerrr.plist",
    "~/Library/WebKit/com.highskore.powerrr",
  ]
end
