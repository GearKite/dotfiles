{ pkgs }:
{
  executable = {
    terminal = "${pkgs.alacritty}/bin/alacritty";
    #browser = "${pkgs.librewolf}/bin/librewolf"; # doesn't work with apparmor for some reason
    browser = "tor-browser";
    filemanager = "${pkgs.nautilus}/bin/nautilus";
  };
}
