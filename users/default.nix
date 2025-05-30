{ username, ... }:
{
  imports = [
    ./${username}/home.nix
  ];

  home.username = username;
  home.homeDirectory = "/home/${username}";
}
