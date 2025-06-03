{ hostname, inputs, ... }:
{
  imports = [
    ./${hostname}
    inputs.home-manager.nixosModules.home-manager

    ../modules/host/audio
    ../modules/host/graphical
    ../modules/host/init
    ../modules/host/locale
    ../modules/host/network
    ../modules/host/nix
    ../modules/host/zram
  ];

  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;
}
