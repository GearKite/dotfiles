{
  colorschemes.catppuccin = {
    enable = true;
    settings = {
      flavour = "mocha";
      transparent_background = true;
      integrations = {
        gitsigns = true;
        nvimtree = true;
        treesitter = true;
        notify = true;
        fidget = true;
        indent_blankline = {
          enabled = true;
          colored_indent_levels = true;
        };
        noice = true;
        rainbow_delimiters = true;
        telescope.enabled = true;
        illuminate = {
          enabled = true;
          lsp = true;
        };
        which_key = true;
        render_markdown = true;
      };
    };
  };
}
