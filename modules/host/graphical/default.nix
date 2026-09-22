{
  pkgs,
  lib,
  ...
}:
{
  services.xserver.enable = false;

  services.displayManager.sddm.enable = true;
  services.displayManager.sddm.wayland.enable = true;

  # graphical pinentry
  programs.ssh = {
    enableAskPassword = true;
    askPassword = lib.getExe pkgs.kdePackages.ksshaskpass;
    startAgent = true;
  };

  programs.gnupg.agent = {
    enable = true;
    pinentryPackage = pkgs.pinentry-all;
  };

  # Monitor brightness control
  environment.systemPackages = with pkgs; [
    brightnessctl
  ];
  services.ddccontrol = {
    enable = true;
  };

  services.gvfs.enable = true;

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };
}
