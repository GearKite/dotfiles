{ pkgs, ... }:
{
  imports = [ ./context.nix ];

  plugins = {
    treesitter = {
      enable = true;
      nixvimInjections = true;

      languageRegister.nu = "nu";

      grammarPackages =
        with pkgs;
        vimPlugins.nvim-treesitter.passthru.allGrammars
        ++ (with tree-sitter-grammars; [
          tree-sitter-nu
        ]);

      settings = {
        highlight.enable = true;
        illuminate.enable = true;
      };
    };
  };

  extraFiles = with pkgs.tree-sitter-grammars; {
    "/queries/nu/highlights.scm".source = "${tree-sitter-nu}/queries/nu/highlights.scm";
    "/queries/nu/indents.scm".source = "${tree-sitter-nu}/queries/nu/indents.scm";
    "/queries/nu/injections.scm".source = "${tree-sitter-nu}/queries/nu/injections.scm";
  };

  filetype = {
    extension = {
      nu = "nu";
    };
  };

  extraConfigLua = ''
    local parser_config = require("nvim-treesitter.parsers").get_parser_configs()

    parser_config.nu = {
      filetype = "nu",
    }
  '';
}
