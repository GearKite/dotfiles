_: {
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
      ansiblels.enable = true;
      basedpyright.enable = true;
      eslint.enable = true;
      html.enable = true;
      jsonls.enable = true;
      marksman.enable = true;
      statix.enable = true;
      nixd = {
        enable = true;
        config = {
          formatting.command = "nixfmt";
        };
      };
    };
  };
}
