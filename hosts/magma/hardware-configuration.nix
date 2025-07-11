# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{
  config,
  lib,
  modulesPath,
  ...
}:

{
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
  ];

  boot.initrd.availableKernelModules = [
    "vmd"
    "xhci_pci"
    "ahci"
    "nvme"
    "usbhid"
  ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-intel" ];
  boot.extraModulePackages = [ ];

  fileSystems."/" = {
    device = "/dev/disk/by-uuid/7cfbfdcc-47ce-4d52-8361-44c0947c4909";
    fsType = "ext4";
  };

  boot.initrd.luks.devices."luks-b88ad8b5-1cae-4169-8de1-36358583bb4b".device =
    "/dev/disk/by-uuid/b88ad8b5-1cae-4169-8de1-36358583bb4b";

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/DB19-D713";
    fsType = "vfat";
    options = [
      "fmask=0022"
      "dmask=0022"
    ];
  };

  fileSystems."/mnt/old" = {
    device = "192.168.2.27:/mnt/old-hdds";
    fsType = "nfs4";
  };

  fileSystems."/mnt/bulk" = {
    device = "192.168.2.27:/mnt/home/server";
    fsType = "nfs4";
  };

  fileSystems."/mnt/family" = {
    device = "192.168.2.27:/mnt/home/family";
    fsType = "nfs4";
  };

  swapDevices = [
    { device = "/dev/disk/by-uuid/5d72a8af-4a9b-4028-8063-2b16101ec5e5"; }
  ];

  networking.useDHCP = lib.mkDefault true;

  services.openssh.allowedInterfaces = [
    "zt+"
    "enp5s0"
  ];

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
