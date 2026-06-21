{
  ...
}:
{
  config = {
    users.users.next = {
      isNormalUser = true;

      extraGroups = [
        "networkmanager"
        "wheel"
        "docker"
        "libvirtd"
        "adbusers"
        "scanner"
        "lp"
        "dialout"
      ];
    };

    home-manager.users.next = {
      home.stateVersion = "24.05";
      programs.home-manager.enable = true;
    };
  };

  imports = [
    ./alacritty
    ./browser
    ./desktop
    ./editor
    ./shell
    ./syncthing

    ./packages/development.nix
    ./packages/image.nix
    ./packages/office.nix
    ./packages/pentest.nix
    ./packages/utils.nix
    ./packages/video.nix
  ];
}
