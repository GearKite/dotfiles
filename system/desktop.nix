{ pkgs, ... }:
{
  # Enable the X11 windowing system.
  # You can disable this if you're only using the Wayland session.
  services.xserver.enable = true;

  services.displayManager.sddm.enable = true;

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
      corefonts
      vistafonts
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
}
