{
  lib,
  pkgs,
  ...
}:
{
  plugins.conform-nvim = {
    enable = true;
    settings = {
      formatters_by_ft = {
        bash = [
          "shellcheck"
          "shellharden"
          "shfmt"
        ];
        cpp = [ "clang_format" ];
        javascript = {
          __unkeyed-1 = "prettierd";
          __unkeyed-2 = "prettier";
          timeout_ms = 2000;
          stop_after_first = true;
        };
        nix = [
          "nixfmt"
          "deadnix"
          "statix"
        ];
      };
      format_on_save = ''
        function(bufnr)
          return { timeout_ms = 200, lsp_fallback = true, lsp_format = "first" }, on_format
          end
      '';
      log_level = "warn";
      notify_on_error = true;
      notify_no_formatters = true;
      formatters = {
        deadnix = {
          command = lib.getExe pkgs.deadnix;
          stdin = false;
          append_fname = true;
          args = [ "--edit" ];
        };
        statix = {
          command = lib.getExe pkgs.statix;
          stdin = false;
          append_fname = true;
          ignore_exitcode = true;
          args = [
            "fix"
          ];
          stream = "stdout";
        };
      };
    };
  };
}
