{ stable, ... }:
{
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  services.fwupd.enable = true;

  boot.kernelPackages = stable.pkgs.linuxPackages;
}
