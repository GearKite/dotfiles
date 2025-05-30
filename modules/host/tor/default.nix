_: {
  services.tor = {
    enable = true;
    openFirewall = false;

    client = {
      enable = true;
    };
  };
}
