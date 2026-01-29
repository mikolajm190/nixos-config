{
  programs.vim = {
    enable = true;
    defaultEditor = true;
  };

  programs.nvf = {
    enable = true;
    settings.vim = {
      viAlias = true;
      vimAlias = true;
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
     };
    };
  };
}
