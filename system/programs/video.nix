{
  config,
  pkgs,
  ...
}:
let
  unstable = import <nixos-unstable> { };
in
{
  environment.systemPackages = with pkgs; [
    (pkgs.wrapOBS {
      plugins = with pkgs.obs-studio-plugins; [
        wlrobs
        obs-backgroundremoval
        obs-pipewire-audio-capture
      ];
    })

    yt-dlp
    ffmpeg-full
    easyeffects
    qjackctl
    unstable.kdePackages.kdenlive
    unstable.jellyfin-mpv-shim
  ];

  # OBS virtual cam
  boot.extraModulePackages = with config.boot.kernelPackages; [
    v4l2loopback
  ];
  boot.extraModprobeConfig = ''
    options v4l2loopback devices=1 video_nr=1 card_label="OBS Cam" exclusive_caps=1
  '';
  security.polkit.enable = true;
}
