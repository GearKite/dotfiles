{
  pkgs,
  ...
}:
let
  unstable = import <nixos-unstable> {
    config = {
      permittedInsecurePackages = [
        "olm-3.2.16"
        "fluffychat-linux-1.25.1"
      ];
    };
  };

  gomuksFlake = builtins.getFlake "github:gearkite/gomuks/flake-package";
  gomuksFromFlake = gomuksFlake.packages.${pkgs.system}.gomuks;
in
{
  environment.systemPackages = with pkgs; [
    # browsers
    tor-browser
    unstable.brave
    ungoogled-chromium
    unstable.librewolf

    # internet
    thunderbird
    nextcloud-client
    monero-gui
    unstable.qbittorrent

    # media
    mpv
    vlc
    loupe
    lollypop
    nicotine-plus
    picard

    # messengers (i use them all, mostly)
    signal-desktop
    unstable.element-desktop
    simplex-chat-desktop
    unstable.cwtch-ui
    unstable.fluffychat
    gomuksFromFlake

    # utils & misc
    (openai-whisper-cpp.override {
      cudaSupport = true; # Enable CUDA support
    })
    unstable.mcpelauncher-ui-qt
    distrobox
    qgis
    qalculate-gtk
    onlyoffice-bin_latest
    (unstable.josm.override {
      # Give JOSM a bit more RAM (hopefully it's enough :sob:)
      extraJavaOpts = "-Xmx32G";
    })
  ];

  nixpkgs.overlays = [
    (self: super: {
      mpv = super.mpv.override {
        scripts = [ self.mpvScripts.mpris ];
      };
    })
  ];

  programs.kdeconnect = {
    enable = true;
  };
}
