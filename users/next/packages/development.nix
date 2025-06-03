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
    nixfmt-rfc-style

    # android
    scrcpy
  ];

  programs.direnv.enable = true;

  programs.mtr.enable = true;
}
