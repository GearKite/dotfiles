{
  pkgs,
  config,
  ...
}:
{
  home-manager.users.${config.modules.username}.home.packages = with pkgs; [
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
}
