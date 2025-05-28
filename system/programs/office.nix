{
  pkgs,
  ...
}:
let
  unstable = import <nixos-unstable> {
    config = {
      permittedInsecurePackages = [
        "olm-3.2.16"
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
    unstable.lrcget

    # messengers (i use them all, mostly)
    signal-desktop
    unstable.element-desktop
    simplex-chat-desktop
    unstable.cwtch-ui
    gomuksFromFlake

    # utils & misc
    (openai-whisper-cpp.override {
      cudaSupport = true; # Enable CUDA support
    })
    distrobox
    qgis
    qalculate-gtk
    onlyoffice-bin_latest
    (unstable.josm.override {
      # Give JOSM a bit more RAM (hopefully it's enough :sob:)
      extraJavaOpts = "-Xmx32G";
    })

    # SDR
    unstable.sdrpp
    unstable.satdump
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
