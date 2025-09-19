{
  pkgs,
  inputs,
  ...
}:
{
  home-manager.users.next = {
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

      # messengers
      signal-desktop
      element-desktop
      inputs.gomuks.packages.${pkgs.system}.gomuks
      dino

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
      nautilus

      # SDR
      sdrpp
      satdump

      # games
      prismlauncher
    ];

    services.kdeconnect = {
      enable = true;
    };
  };

  networking.firewall = {
    allowedTCPPorts = [ 2234 ];
  };

  services.zerotierone = {
    enable = true;
  };

  allowed-unfree = [ "zerotierone" ]; # :(

  virtualisation.waydroid.enable = true;
}
