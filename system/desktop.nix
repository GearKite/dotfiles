{ pkgs, ... }: {
  # Enable the X11 windowing system.
  # You can disable this if you're only using the Wayland session.
  services.xserver.enable = true;

  # Enable the KDE Plasma Desktop Environment.
  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;

  programs.hyprland.enable = true;

  # Configure keymap in X11
  services.xserver = {
    xkb = {
      layout = "lv";
      variant = "";
    };
  };

  environment.systemPackages = with pkgs; [
    twemoji-color-font
    ddcutil
  ];

  fonts = {
    enableDefaultPackages = true;
    packages = with pkgs; [
      noto-fonts
      noto-fonts-cjk
      noto-fonts-emoji
      nerdfonts
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
    ];
    fontDir.enable = true;

  };

}
