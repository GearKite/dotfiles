{
  pkgs,
  config,
  ...
}:
{
  home-manager.users.${config.modules.username}.home.packages = with pkgs; [
    gimp3
    krita
    darktable
    imagemagick
    exiftool
    inkscape
  ];

}
