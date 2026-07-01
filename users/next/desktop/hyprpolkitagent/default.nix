{
  inputs,
  system,
  ...
}:
{
  home-manager.users.next = {
    services.hyprpolkitagent = {
      enable = true;
      package = inputs.hyprpolkitagent.packages.${system}.hyprpolkitagent;
    };
  };
}
