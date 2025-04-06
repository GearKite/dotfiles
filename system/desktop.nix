{ pkgs, ... }:
{
  services.xserver.enable = false;

  services.displayManager.sddm.enable = true;
  services.displayManager.sddm.wayland.enable = true;

  programs.hyprland.enable = true;

  # Configure keymap in X11
  services.xserver = {
    xkb = {
      layout = "lv";
      variant = "";
    };
  };

  environment.systemPackages = with pkgs; [
    ddcutil
    jmtpfs
  ];

  fonts = {
    enableDefaultPackages = true;
    packages = with pkgs; [
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-emoji
      twemoji-color-font
      liberation_ttf
      fira-code
      fira-code-symbols
      mplus-outline-fonts.githubRelease
      dina-font
      proggyfonts
      font-awesome
      material-design-icons
    ];
    fontDir.enable = true;

  };

  # For ddcutil
  hardware.i2c = {
    enable = true;
  };

  services.fwupd.enable = true;

  services.gvfs.enable = true;
}
