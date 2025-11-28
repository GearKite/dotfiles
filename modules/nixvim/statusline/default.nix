_: {
  plugins.lualine = {
    enable = true;

    settings = {
      sections = {
        lualine_c = [
          {
            __unkeyed-1 = "filename";
            path = 1;
          }
        ];
      };

      options = {
        component_separators = "";
        section_separators = "";
      };
    };
  };
}
