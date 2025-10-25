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
      ungoogled-chromium

      # internet
      thunderbird
      monero-gui
      qbittorrent

      # media
      mpv
      oculante
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
          hash = "sha256-9YvNs925xBUYEpF429rHfMXIGPapVYd8j1jZa/yBuhA=";
        };

      }))
      element-desktop
      inputs.gomuks.packages.${pkgs.system}.gomuks

      # utils & misc
      distrobox
      qalculate-gtk
      onlyoffice-bin_latest
      (josm.override {
        # Give JOSM a bit more RAM (hopefully it's enough :sob:)
        extraJavaOpts = "-Xmx32G";
      })
      logseq
      nautilus

      # SDR
      satdump
    ];

    services.kdeconnect = {
      enable = true;
    };

    services.jellyfin-mpv-shim = {
      enable = true;
    };

    services.etesync-dav = {
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
}
