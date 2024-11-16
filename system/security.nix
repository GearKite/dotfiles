{ pkgs, ... }: {
  programs.mtr.enable = true;
  programs.gnupg.agent = {
    enable = true;
    pinentryPackage = pkgs.pinentry-tty;
    enableSSHSupport = true;
  };

  programs.firejail = {
    enable = true;
    wrappedBinaries = {
      librewolf = {
        executable = "${pkgs.librewolf}/bin/librewolf";
        profile = "${pkgs.firejail}/etc/firejail/librewolf.profile";
        extraArgs = [
          # Required for U2F USB stick
          "--ignore=private-dev"
          # Enforce dark mode
          "--env=GTK_THEME=Adwaita:dark"
          # Enable system notifications
          "--dbus-user.talk=org.freedesktop.Notifications"
        ];
      };
      #signal-desktop = {
      #  executable = "${pkgs.signal-desktop}/bin/signal-desktop --enable-features=UseOzonePlatform --ozone-platform=wayland";
      #  profile = "${pkgs.firejail}/etc/firejail/signal-desktop.profile";
      #  extraArgs = [ "--env=GTK_THEME=Adwaita:dark" ];
      #};
    };
  };

  security.sudo = {
    enable = true;
    extraRules = [{
      commands = [
        {
          command = "${pkgs.ddcutil}/bin/ddcutil";
          options = [ "NOPASSWD" ];
        }
        {
          command = "/run/current-system/sw/bin/ddcutil";
          options = [ "NOPASSWD" ];
        }
      ];
      groups = [ "wheel" ];
    }];
    extraConfig = with pkgs; ''
      Defaults:picloud secure_path="${lib.makeBinPath [
        ddcutil
      ]}:/nix/var/nix/profiles/default/bin:/run/current-system/sw/bin"
    '';
  };

  programs.seahorse.enable = true;

  security.pam.services.hyprlock = {};
}
