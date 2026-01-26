{config, ...}: {
  programs.git = {
    enable = true;
    includes = [
      {
        path = "${config.home.homeDirectory}/.config/git-private/gitconfig";
      }
    ];
    settings = {
      alias = {
        st = "status";
        lo = "log --oneline";
      };
    };
  };
}
