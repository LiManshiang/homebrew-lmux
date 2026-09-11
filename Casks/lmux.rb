cask "lmux" do
  version :latest
  sha256 :no_check

  # Every release publishes both architectures under stable asset names, so this
  # cask never needs a version bump: releases/latest always resolves to the
  # newest build for the host architecture.
  on_arm do
    url "https://github.com/LiManshiang/lmux/releases/latest/download/lmux-macos.zip",
        verified: "github.com/LiManshiang/lmux/"
    # The Ghostty GPU renderer needs macOS 13.
    depends_on macos: :ventura
  end

  on_intel do
    url "https://github.com/LiManshiang/lmux/releases/latest/download/lmux-macos-intel.zip",
        verified: "github.com/LiManshiang/lmux/"
    # Intel Macs use the SwiftTerm renderer, which still supports macOS 12.
    depends_on macos: :monterey
  end

  name "lmux"
  desc "Native macOS workbench for CodeBuddy Code and Claude Code"
  homepage "https://github.com/LiManshiang/lmux"

  app "lmux.app"

  caveats <<~EOS
    lmux is not notarized yet, so macOS may block the first launch.
    Open it once with: right-click the app in Applications, then choose Open.
  EOS

  zap trash: [
    "~/.lmux",
    "~/Library/Application Support/lmux",
    "~/Library/Preferences/com.manshiangli.lmux.plist",
    "~/Library/Preferences/com.manshiangli.lmux-st.plist",
  ]
end
