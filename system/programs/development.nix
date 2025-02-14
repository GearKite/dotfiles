{ config, lib, pkgs, ... }: {
  programs.adb.enable = true;

  environment.systemPackages = with pkgs; [
    git
    vscode-fhs
    nixfmt-rfc-style
    sqlitebrowser
    ansible
    (pkgs.callPackage <agenix/pkgs/agenix.nix> {})
  ];

  virtualisation.docker = {
    enable = true;
    enableNvidia = true; # deprecated, but '--gpus' doesn't work without this
  };

  programs.direnv.enable = true;  
}
