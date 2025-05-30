{
  pkgs,
  inputs,
  config,
  ...
}:
{
  home-manager.users.${config.modules.username} = {
    home.packages = with pkgs; [
      # browsers
      tor-browser
      brave
      ungoogled-chromium

      # internet
      thunderbird
      nextcloud-client
      monero-gui
      qbittorrent

      # media
      (mpv.override {
        scripts = [ mpvScripts.mpris ];
      })
      vlc
      loupe
      lollypop
      nicotine-plus
      picard
      lrcget

      # messengers (i use them all, mostly)
      signal-desktop
      element-desktop
      simplex-chat-desktop
      cwtch-ui
      inputs.gomuks.packages.${pkgs.system}.gomuks

      # utils & misc
      (openai-whisper-cpp.override {
        cudaSupport = true; # Enable CUDA support
      })
      distrobox
      qgis
      qalculate-gtk
      onlyoffice-bin_latest
      (josm.override {
        # Give JOSM a bit more RAM (hopefully it's enough :sob:)
        extraJavaOpts = "-Xmx32G";
      })
      logseq

      # SDR
      sdrpp
      satdump
    ];

    services.kdeconnect = {
      enable = true;
    };
  };
}
