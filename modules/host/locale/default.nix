{ lib, ... }:
{
  i18n.defaultLocale = "lv_LV.UTF-8";
  i18n.extraLocales = [
    "en_GB.UTF-8/UTF-8"
  ];

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "lv_LV.UTF-8";
    LC_IDENTIFICATION = "lv_LV.UTF-8";
    LC_MEASUREMENT = "lv_LV.UTF-8";
    LC_MONETARY = "lv_LV.UTF-8";
    LC_NAME = "lv_LV.UTF-8";
    LC_NUMERIC = "lv_LV.UTF-8";
    LC_PAPER = "lv_LV.UTF-8";
    LC_TELEPHONE = "lv_LV.UTF-8";
    LC_TIME = "en_DK.UTF-8";
  };

  time.timeZone = lib.mkDefault "Europe/Riga";
  services.automatic-timezoned.enable = true;
}
