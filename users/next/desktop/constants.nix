{
  pkgs,
  lib,
  ...
}:
{
  options.modules.executable = {
    terminal = lib.mkOption {
      type = lib.types.str;
      default = "${pkgs.alacritty}/bin/alacritty";
    };
    browser = lib.mkOption {
      type = lib.types.str;
      default = "${pkgs.tor-browser}/bin/tor-browser";
    };
    filemanager = lib.mkOption {
      type = lib.types.str;
      default = "${pkgs.nautilus}/bin/nautilus";
    };
  };
}
