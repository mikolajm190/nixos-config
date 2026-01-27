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
        name = "gruvbox";
        style = "dark";
      };

      statusline.lualine.enable = true;
      telescope.enable = true;
      autocomplete.nvim-cmp.enable = true;

      lsp.enable = true;

      languages = {
        enableTreesitter = true;

        nix.enable = true;
        clang.enable = true;
        sql.enable = true;
        bash.enable = true;
        python.enable = true;
      };
    };
  };
}
