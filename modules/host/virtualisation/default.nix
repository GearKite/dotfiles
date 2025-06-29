{ pkgs, ... }:
{
  environment.systemPackages = [ pkgs.qemu ];
  programs.virt-manager.enable = true;

  virtualisation = {
    libvirtd.enable = true;
    spiceUSBRedirection.enable = true;
  };

  virtualisation.docker.enable = true;

  hardware.graphics.enable = true;
}
