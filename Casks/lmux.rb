cask "lmux" do
  version :latest
  sha256 :no_check

  # Every release publishes both architectures under stable asset names, so this
  # cask never needs a version bump: releases/latest always resolves to the
  # newest build for the host architecture.
  on_arm do
    url "https://github.com/LiManshiang/lmux/releases/latest/download/lmux-macos.zip"
    # The Ghostty GPU renderer needs macOS 13.
    depends_on macos: :ventura
  end

  on_intel do
    url "https://github.com/LiManshiang/lmux/releases/latest/download/lmux-macos-intel.zip"
    # Intel Macs use the SwiftTerm renderer, which still supports macOS 12.
    depends_on macos: :monterey
  end

  name "lmux"
  desc "Native macOS workbench for CodeBuddy Code and Claude Code"
  homepage "https://github.com/LiManshiang/lmux"

  app "lmux.app"

  caveats <<~EOS
    lmux is ad-hoc signed rather than notarized, so macOS blocks the first launch.
    Double-clicking shows an "Apple could not verify" dialog that offers only
    Done and Move to Trash — there is no way through from that dialog.

    To open it the first time:
      System Settings -> Privacy & Security -> Security -> "Open Anyway"
      then confirm. You only need to do this once.
  EOS

  zap trash: [
    "~/.lmux",
    "~/Library/Application Support/lmux",
    "~/Library/Preferences/com.manshiangli.lmux.plist",
    "~/Library/Preferences/com.manshiangli.lmux-st.plist",
  ]
end
