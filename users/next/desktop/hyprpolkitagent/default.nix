{ pkgs, ... }:
{
  home-manager.users.next = {
    services.hyprpolkitagent = {
      enable = true;
      package = pkgs.hyprpolkitagent;
    };
  };
}
