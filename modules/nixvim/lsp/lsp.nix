{ pkgs, ... }: {
  plugins = {
    lspconfig = {
      enable = true;
    };

    lspkind = {
      enable = true;
    };

    none-ls.enable = true;
  };

  lsp = {
    inlayHints.enable = true;
    servers = {
      "*" = {
        config = {
          capabilities = {
            textDocument = {
              semanticTokens = {
                multilineTokenSupport = true;
              };
            };
          };
          root_markers = [
            ".git"
          ];
        };
      };
      ansiblels = {
        enable = true;
        package = pkgs.ansible-language-server;
      };
      basedpyright.enable = true;
      cssls.enable = true;
      eslint.enable = true;
      html.enable = true;
      jsonls.enable = true;
      marksman.enable = true;
      nixd = {
        enable = true;
        config = {
          formatting.command = "nixfmt";
        };
      };
      shuck.enable = true;
      statix.enable = true;
      superhtml.enable = true;
      systemd_lsp = {
        enable = true;
        package = pkgs.systemd-lsp;
      };
      taplo.enable = true;
      yamlls.enable = true;
    };
  };
}
