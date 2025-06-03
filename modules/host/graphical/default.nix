{ pkgs, ... }:
{
  services.xserver.enable = false;

  services.displayManager.sddm.enable = true;
  services.displayManager.sddm.wayland.enable = true;

  environment.systemPackages = with pkgs; [
    ddcutil
    jmtpfs
  ];

  # graphical pinentry
  programs.ssh.askPassword = "${pkgs.kdePackages.ksshaskpass.out}/bin/ksshaskpass";
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
