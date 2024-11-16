{ config, lib, pkgs, ... }: {
  programs.adb.enable = true;

  environment.systemPackages = with pkgs; [
    git
    vscode-fhs
    nixpkgs-fmt
    sqlitebrowser
    ansible
  ];

  virtualisation.docker.enable = true;
  programs.direnv.enable = true;

}
