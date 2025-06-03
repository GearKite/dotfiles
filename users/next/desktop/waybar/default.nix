{ pkgs, ... }:
{
  home-manager.users.next = {
    imports = [
      ./modules.nix
      ./settings.nix
      ./quicklinks.nix
    ];

    programs.waybar = {
      enable = true;
      package = pkgs.waybar;
      style = ./style.css;
    };
  };

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
}
