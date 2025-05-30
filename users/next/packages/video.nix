{
  pkgs,
  config,
  ...
}:
{
  home-manager.users.${config.modules.username}.home.packages = with pkgs; [
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
}
