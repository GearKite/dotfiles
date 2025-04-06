{ pkgs }:
{
  executable = {
    terminal = "${pkgs.alacritty}/bin/alacritty";
    #browser = "${pkgs.librewolf}/bin/librewolf"; # doesn't work with apparmor for some reason
    browser = "librewolf";
    filemanager = "${pkgs.nautilus}/bin/nautilus";
  };
}
