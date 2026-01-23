{ pkgs, ... }:
{
  environment.systemPackages = [
    pkgs.qemu
    (pkgs.writeShellScriptBin "qemu-system-x86_64-uefi" ''
      qemu-system-x86_64 \
        -bios ${pkgs.OVMF.fd}/FV/OVMF.fd \
        "$@"
    '')
  ];
  programs.virt-manager.enable = true;

  virtualisation = {
    libvirtd.enable = true;
    spiceUSBRedirection.enable = true;
  };

  virtualisation.docker.enable = true;

  hardware.graphics.enable = true;
}
