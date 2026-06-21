{ pkgs, ... }:
{
  home-manager.users.next = {
    services.hyprsunset = {
      enable = true;
      package = pkgs.hyprsunset;

    };
  };
}
