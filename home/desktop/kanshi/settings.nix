{ config, pkgs, ... }:
{
  services.kanshi.settings = [
    {
      profile.outputs = [
        {
          criteria = "GIGA-BYTE TECHNOLOGY CO., LTD. G27Q 21502B003480";
          mode = "2560x1440@144";
          position = "0,0";
          adaptiveSync = true;
          status = "enable";
        }
        {
          criteria = "LG Electronics L194WT 0x000627AF";
          mode = "1440x900@59.887";
          position = "2560,540";
          status = "enable";
        }
      ];
    }

    {
      profile.outputs = [
        {
          criteria = "GIGA-BYTE TECHNOLOGY CO., LTD. G27Q 21502B003480";
          mode = "2560x1440@144";
          position = "0,0";
          adaptiveSync = true;
          status = "enable";
        }
      ];
    }

    {
      profile.outputs = [
        {
          criteria = "BOE 0x0729 Unknown";
          mode = "1920x1080@60";
          position = "0,0";
          status = "enable";
          scale = 1.0;
        }
      ];
    }

    {
      profile.outputs = [
        {
          criteria = "BOE 0x0729 Unknown";
          mode = "1920x1080@60";
          position = "0,0";
          status = "enable";
          scale = 1.0;
        }
        {
          criteria = "HDMI-A-1";
          status = "enable";
        }
      ];
    }

    {
      profile.outputs = [
        {
          criteria = "LG Electronics LG ULTRAGEAR 311NTMX2J683";
          mode = "2560x1440@143.97Hz";
          position = "1920,0";
          status = "enable";
          scale = 1.0;
          adaptiveSync = true;
        }
        {
          criteria = "Samsung Electric Company SAMSUNG 0x01000E00";
          mode = "3840x2160@60.00Hz";
          position = "4480,120";
          status = "enable";
          scale = 2.0;
        }
        {
          criteria = "Dell Inc. DELL SE2219H C329B23";
          mode = "1920x1080@60.00Hz";
          position = "0,360";
          status = "enable";
          scale = 1.0;
        }
      ];
    }

  ];
}
