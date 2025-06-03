{
  pkgs,
  config,
  ...
}:
{
  home-manager.users.next.home.packages = with pkgs; [
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
    kdePackages.kdenlive
    jellyfin-mpv-shim
    audacity
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
