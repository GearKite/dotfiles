{ config, lib, ... }:
{
  options.modules.username = lib.mkOption {
    type = lib.types.str;
    default = "next";
    readOnly = true;
  };

  config = {
    users.users.${config.modules.username} = {
      isNormalUser = true;

      extraGroups = [
        "networkmanager"
        "wheel"
        "docker"
        "libvirtd"
        "adbusers"
        "scanner"
        "lp"
      ];
    };

    #home-manager.users.next = {
    #  home.stateVersion = stateVersion;
    #  #imports = [outputs.homeConfigurations.next.config];
    #};

    home-manager.users.next = ./home.nix;

    programs.adb.enable = true;
  };

  imports = [
    ./browser
    ./desktop
    ./shell

    ./packages/development.nix
    ./packages/image.nix
    ./packages/office.nix
    ./packages/pentest.nix
    ./packages/utils.nix
    ./packages/video.nix
  ];
}
