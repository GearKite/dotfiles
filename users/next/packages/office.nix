{
  pkgs,
  ...
}:
let
  mpvScripts = with pkgs.mpvScripts; [ mpris ];
in
{
  home-manager.users.next = {
    home.packages = with pkgs; [
      # browsers
      tor-browser
      ungoogled-chromium

      # internet
      thunderbird
      qbittorrent

      # media
      oculante
      beets
      strawberry

      # messengers
      signal-desktop
      #(signal-desktop.overrideAttrs (oldAttrs: {
      #  patches = [ ./custom/signal-desktop.patch ];
      #  # build fails without replacing pnpm deps hash
      #  pnpmDeps = fetchPnpmDeps {
      #    inherit (oldAttrs)
      #      pname
      #      version
      #      src
      #      patches
      #      ;
      #    inherit pnpm;
      #    fetcherVersion = 3;
      #    hash = "sha256-3EEeHmtOAdcm2Q3eNUEl2RbTFRB4YBKcZLFtEmwbVOk=";
      #  };
      #}))
      gomuks-web

      # utils & misc
      qalculate-gtk
      onlyoffice-desktopeditors
      (josm.override {
        # Give JOSM a bit more RAM (hopefully it's enough :sob:)
        extraJavaOpts = "-Xmx32G";
      })
      nautilus
      keepassxc
      cozy
      naps2

      (qgis.overrideAttrs (oldAttrs: {
        extraPythonPackages = [ pkgs.python3Packages.pillow ];
        nativeBuildInputs = oldAttrs.nativeBuildInputs ++ [
          pkgs.opencl-headers
          pkgs.ocl-icd
        ];
      }))

      sshfs

      # SDR
      satdump

      (prismlauncher.override {
        jdks = [
          jdk25
          jdk21
          jdk17
          jdk8
        ];
      })
    ];

    programs.mpv = {
      enable = true;
      scripts = mpvScripts;
    };

    services.jellyfin-mpv-shim = {
      enable = true;
    };

    services.activitywatch = {
      enable = false;
      watchers = {
        awatcher = {
          package = pkgs.awatcher;
          settings = {
            awatcher = {
              idle-timeout-seconds = 180;
              poll-time-idle-seconds = 4;
              poll-time-window-seconds = 1;
            };
          };
        };
      };
    };

    programs.opencode = {
      enable = true;
      web.enable = true;
    };
  };

  programs.kdeconnect.enable = true;

  services.flatpak.enable = true;

  nixpkgs.config.permittedInsecurePackages = [
    "olm-3.2.16" # for gomuks
  ];

  hardware.rtl-sdr.enable = true;
  boot.kernelParams = [ "modprobe.blacklist=dvb_usb_rtl28xxu" ]; # blacklist this module
  services.udev.packages = [ pkgs.rtl-sdr ]; # (there might be other packages that require udev here too)

  networking.firewall = {
    allowedTCPPorts = [ 2234 ];
  };

  services.zerotierone = {
    enable = true;
  };

  allowed-unfree = [ "zerotierone" ]; # :(
}
