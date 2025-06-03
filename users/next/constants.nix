{
  pkgs,
  lib,
  config,
  ...
}:
{
  options.modules = {
    executable = {
      terminal = lib.mkOption {
        type = lib.types.str;
        default = "";
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
    container = lib.mkOption {
      type = lib.types.bool;
      default = !config.modules.host;
    };
    host = lib.mkOption {
      type = lib.types.bool;
      default = !config.modules.container;
    };
  };
}
