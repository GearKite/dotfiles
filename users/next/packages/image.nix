{
  pkgs,
  ...
}:
{
  home-manager.users.next.home.packages = with pkgs; [
    gimp3
    krita
    darktable
    imagemagick
    exiftool
    inkscape
  ];

}
