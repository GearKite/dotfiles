{ pkgs, ... }: {
  home-manager.users.next = {
    services.syncthing = {
      enable = true;
      package = pkgs.syncthing;
    };
  };
}
