cask "lmux" do
  version "1.0.226"
  sha256 "a8d127f28f818f1014a2af00c6d14e7c73866980cee27a74c39d895413e457ad"

  url "https://github.com/LiManshiang/lmux/releases/download/v#{version}/lmux-#{version}-macos.zip",
      verified: "github.com/LiManshiang/lmux/"
  name "lmux"
  desc "Native macOS workbench for CodeBuddy Code and Claude Code"
  homepage "https://github.com/LiManshiang/lmux"

  depends_on macos: ">= :ventura"

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
