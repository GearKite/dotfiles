_: {
  home-manager.users.next = {
    xdg = {
      mimeApps = {
        enable = true;
        defaultApplications = {
          "image/jpeg" = "oculante.desktop";
          "image/png" = "oculante.desktop";
          "image/gif" = "oculante.desktop";
          "image/webp" = "oculante.desktop";
          "image/tiff" = "oculante.desktop";
        };
      };

      configFile."mimeapps.list".force = true;
    };
  };
}
