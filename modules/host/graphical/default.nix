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
    enable = false;
  };

  services.gvfs.enable = true;

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  fonts = {
    packages =
      with pkgs;
      [
        noto-fonts
        fira-code
        open-dyslexic
      ]
      ++ builtins.filter lib.attrsets.isDerivation (builtins.attrValues pkgs.nerd-fonts);
    enableDefaultPackages = true;
    fontDir.enable = true;
  };
}
