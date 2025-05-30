{ hostname, inputs, ... }:
{
  imports = [
    ./${hostname}
    inputs.home-manager.nixosModules.home-manager
  ];

  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;

  system.autoUpgrade = {
    enable = true;
    dates = "02:00";
    randomizedDelaySec = "45min";
    persistent = true;
    flake = "github:gearkite/dotfiles#${hostname}";
    flags = [ "--accept-flake-config" ];
  };
}
