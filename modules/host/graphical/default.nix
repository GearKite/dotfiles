{
  pkgs,
  lib,
  ...
}:
{
  services.xserver.enable = false;

  services.displayManager.sddm.enable = true;
  services.displayManager.sddm.wayland.enable = true;

  environment.systemPackages = with pkgs; [
    ddcutil
    jmtpfs
  ];

  # graphical pinentry
  programs.ssh = {
    enableAskPassword = true;
    askPassword = lib.getExe pkgs.kdePackages.ksshaskpass;
  };
  programs.gnupg.agent = {
    enable = true;
    pinentryPackage = pkgs.pinentry-tty;
    enableSSHSupport = true;
  };

  # For ddcutil
  hardware.i2c = {
    enable = true;
  };

  services.gvfs.enable = true;

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };
}
