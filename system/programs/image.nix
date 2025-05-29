{
  pkgs,
  ...
}:
let
  unstable = import <nixos-unstable> { };
in
{
  environment.systemPackages = with pkgs; [
    unstable.gimp3
    unstable.krita
    darktable
    imagemagick
    exiftool
    unstable.inkscape
  ];

}
