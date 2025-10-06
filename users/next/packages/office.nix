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
      oculante
      lollypop
      nicotine-plus
      (picard.overrideAttrs (oldAttrs: {
        preFixup = oldAttrs.preFixup + ''makeWrapperArgs+=(--prefix PATH : ${lib.makeBinPath [ rsgain ]})'';
      }))

      lrcget

      # messengers
      (signal-desktop.overrideAttrs (oldAttrs: {
        patches = [ ./custom/signal-desktop.patch ];
        # build fails without replacing pnpm deps hash
        pnpmDeps = pnpm.fetchDeps {
          inherit (oldAttrs) pname src version;
          fetcherVersion = 1;
          hash = "sha256-uVVUHvYhBCplKPyuS2+PKCxox8uWU2E/2EXLCG1ot54=";
        };

      }))

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
