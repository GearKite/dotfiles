{
  pkgs,
  ...
}:
{
  home-manager.users.next.home.packages = with pkgs; [
    git
    vscodium-fhs
    sqlitebrowser

    # nix coding tools
    nil
    deadnix
    statix
    nixfmt

    # android
    scrcpy
    android-tools
  ];

  programs.direnv.enable = true;

  programs.mtr.enable = true;
}
