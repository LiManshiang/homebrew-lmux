cask "lmux" do
  version :latest
  sha256 :no_check

  # Stable asset name published by every release, so this cask never needs a
  # version bump: releases/latest always resolves to the newest build.
  url "https://github.com/LiManshiang/lmux/releases/latest/download/lmux-macos.zip",
      verified: "github.com/LiManshiang/lmux/"
  name "lmux"
  desc "Native macOS workbench for CodeBuddy Code and Claude Code"
  homepage "https://github.com/LiManshiang/lmux"

  depends_on macos: :ventura

  app "lmux.app"

  caveats <<~EOS
    lmux is not notarized yet, so macOS may block the first launch.
    Open it once with: right-click the app in Applications, then choose Open.
  EOS

  zap trash: [
    "~/.lmux",
    "~/Library/Application Support/lmux",
    "~/Library/Preferences/com.manshiangli.lmux.plist",
  ]
end
