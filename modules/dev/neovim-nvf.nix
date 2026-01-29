{
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    defaultEditor = true;
  };

  programs.nvf = {
    enable = true;
    settings.vim = {
      theme = {
        enable = true;
        name = "catppuccin";
        style = "macchiato";
      };

      statusline.lualine.enable = true;
      telescope.enable = true;
      autocomplete.nvim-cmp.enable = true;

      lsp.enable = true;

      languages = {
        enableTreesitter = true;

        nix.enable = true;
        clang.enable = true;
        bash.enable = true;
        sql.enable = true;
        python.enable = true;
      };

      options = {
        autoindent = true;
        shiftwidth = 2;
        tabstop = 2;
      };
    };
  };
}
