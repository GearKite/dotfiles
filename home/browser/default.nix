{ config, pkgs, ... }:
let
  lock-false = {
    Value = false;
    Status = "locked";
  };
  lock-true = {
    Value = true;
    Status = "locked";
  };
in
{
  programs.firefox = {
    enable = true;
    package = pkgs.librewolf; # programs.librewolf doesn't (yet) support policies
    policies = {
      # Extensions
      ExtensionSettings = {
        # Bitwarden
        "{446900e4-71c2-419f-a6a7-df9c091e268b}" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/bitwarden-password-manager/latest.xpi";
          installation_mode = "force_installed";
        };
        # ClearURLs
        "CanvasBlocker@kkapsner.de" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/canvasblocker/latest.xpi";
          installation_mode = "force_installed";
        };
        # ClearURLs
        "{74145f27-f039-47ce-a470-a662b129930a}" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/clearurls/latest.xpi";
          installation_mode = "force_installed";
        };
        # Cookie Editor
        "{c3c10168-4186-445c-9c5b-63f12b8e2c87}" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/cookie-editor/latest.xpi";
          installation_mode = "force_installed";
        };
        # Dark Reader
        "addon@darkreader.org" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/darkreader/latest.xpi";
          installation_mode = "force_installed";
        };
        # Decentraleyes
        "jid1-BoFifL9Vbdl2zQ@jetpack" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/decentraleyes/latest.xpi";
          installation_mode = "force_installed";
        };
        # Font Fingerprint Defender
        "{96ef5869-e3ba-4d21-b86e-21b163096400}" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/font-fingerprint-defender/latest.xpi";
          installation_mode = "force_installed";
        };
        # NoScript
        "{73a6fe31-595d-460b-a920-fcc0f8843232}" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/noscript/latest.xpi";
          installation_mode = "force_installed";
        };
        # SponsorBlock
        "sponsorBlocker@ajay.app" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/sponsorblock/latest.xpi";
          installation_mode = "force_installed";
        };
        # uBlock Origin
        "uBlock0@raymondhill.net" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
          installation_mode = "force_installed";
        };
        # Video Speed Controller
        "{7be2ba16-0f1e-4d93-9ebc-5164397477a9}" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/videospeed/latest.xpi";
          installation_mode = "force_installed";
        };
        # Wappalyzer
        "wappalyzer@crunchlabz.com" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/wappalyzer/latest.xpi";
          installation_mode = "force_installed";
        };
      };

      # Preferences
      Preferences = {
        "privacy.donottrackheader.enabled" = lock-true;
        "webgl.disabled" = lock-false;
        "privacy.resistFingerprinting.autoDeclineNoUserInputCanvasPrompts" = lock-true;
      };
    };
  };
}
