{
  config,
  lib,
  pkgs,
  ...
}:
let
  unstable = import <nixos-unstable> {
    config = {
      allowUnfree = true;
    };
  };
in
{
  environment.systemPackages = with pkgs; [
    unstable.element-desktop
    onlyoffice-bin_latest
    (unstable.josm.override {
      # Give JOSM a bit more RAM (hopefully it's enough :sob:)
      extraJavaOpts = "-Xmx32G";
    })
    tor-browser
    mpv
    thunderbird
    ungoogled-chromium
    unstable.librewolf
    distrobox
    qgis
    nextcloud-client
    kgpg
    vlc
    signal-desktop
    qalculate-gtk
    unstable.nuclear
    monero-gui
    loupe
    unstable.qbittorrent
    unstable.mcpelauncher-ui-qt # not exactly an office program :P
    simplex-chat-desktop

    (openai-whisper-cpp.override {
      cudaSupport = true; # Enable CUDA support
    })
  ];

  programs.kdeconnect = {
    enable = true;
    package = pkgs.kdePackages.kdeconnect-kde;
  };
}
