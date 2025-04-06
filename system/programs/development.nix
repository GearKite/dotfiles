{
  pkgs,
  ...
}:
{
  programs.adb.enable = true;

  environment.systemPackages = with pkgs; [
    git
    vscodium-fhs
    nixfmt-rfc-style
    sqlitebrowser

    # nix coding tools
    nil
    deadnix
    statix
  ];

  virtualisation.docker = {
    enable = true;
    enableNvidia = true; # deprecated, but '--gpus' doesn't work without this
  };

  programs.direnv.enable = true;
}
