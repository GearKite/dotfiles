{ config, pkgs, ... }:
let
  homeConfig = config.home-manager.users.next;
in
{
  home-manager.users.next = {
    programs.zsh = {
      enable = true;
      enableCompletion = true;
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;

      plugins = [
        {
          name = "zsh-nix-shell";
          file = "nix-shell.plugin.zsh";
          src = pkgs.fetchFromGitHub {
            owner = "chisui";
            repo = "zsh-nix-shell";
            rev = "v0.8.0";
            sha256 = "1lzrn0n4fxfcgg65v0qhnj7wnybybqzs4adz7xsrkgmcsr0ii8b7";
          };
        }
      ];

      shellAliases = {
        ll = "ls -l";
        update = "sudo nixos-rebuild --flake /etc/nixos#magma switch";
      };
      history = {
        size = 10000;
        path = "${homeConfig.xdg.dataHome}/zsh/history";
      };
      oh-my-zsh = {
        enable = true;
        plugins = [
          "git"
          "thefuck"
          "direnv"
        ];
        theme = "agnoster";
      };
    };
  };

  programs.zsh.enable = true;
  users.users.next.shell = pkgs.zsh;
}
