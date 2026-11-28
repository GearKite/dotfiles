{
  config,
  pkgs,
  ...
}:
let
  basePath = "${config.xdg.dataHome}/calendars";
  calendar = "mycalendarimport";
  username = "next";
in
{
  accounts.calendar = {
    inherit basePath;

    accounts.${calendar} = {
      local = {
        type = "filesystem";
        path = "${basePath}/${calendar}";
        fileExt = ".ics";
      };

      remote = {
        type = "caldav";

        url = "http://localhost:5232/${username}/${calendar}/";

        userName = username;
        passwordCommand = [
          "${pkgs.libsecret}/bin/secret-tool"
          "lookup"
          "service"
          calendar
          "username"
          username
        ];
      };

      khal = {
        enable = true;
        type = "discover";
        glob = "*";
        readOnly = true;
      };

      vdirsyncer = {
        enable = true;
        auth = "basic";

        # Only copy from the server to the local vdir; don't upload
        # local changes back to Radicale.
        collections = [ calendar ];
      };
    };
  };

  programs.vdirsyncer.enable = true;
  services.vdirsyncer = {
    enable = true;
    frequency = "*:*";
  };

  programs.khal = {
    enable = true;
  };
}
