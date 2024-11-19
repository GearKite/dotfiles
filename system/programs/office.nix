{ config, lib, pkgs, ... }:
let
  unstable = import <nixos-unstable> { config = { allowUnfree = true; }; };
in
{
  environment.systemPackages = with pkgs; [
    unstable.element-desktop
    onlyoffice-bin_latest
    unstable.josm
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

    (openai-whisper-cpp.override {
      cudaSupport = true; # Enable CUDA support
    })
  ];

  programs.kdeconnect = {
    enable = true;
    package = pkgs.kdePackages.kdeconnect-kde;
  };
}
