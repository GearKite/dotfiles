{ pkgs, ... }:
{
  environment.systemPackages = [ pkgs.qemu ];
  programs.virt-manager.enable = true;

  virtualisation = {
    libvirtd.enable = true;
    spiceUSBRedirection.enable = true;
  };

  hardware.graphics.enable = true;
}
