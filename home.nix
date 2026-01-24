{ config, pkgs, ... }:

{
  home.username = "mikolajm";
  home.homeDirectory = "/home/mikolajm";

  fonts.fontconfig.enable = false;

  # Packages that should be installed to the user profile.
  home.packages = with pkgs; [

    # archives
    zip
    unzip

    # utils
    # nnn # cli file manager
    jq # A lightweight and flexible command-line JSON processor

    # misc
    file
    tree
    gnupg

    htop

    # system tools
    pciutils # lspci
    usbutils # lsusb
  ];

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

  programs.kitty = {
    enable = true;

    settings = {
      font_family = "JetBrainsMono Nerd Font";
      font_size = 14;
    };
  };

  programs.bash = {
    enable = true;
    enableCompletion = true;

    shellAliases = {
      ll = "ls -la";
    };

    initExtra = ''
      # Define Colors
      COLOR_ORANGE='\[\033[38;5;208m\]'
      COLOR_GREEN='\[\033[38;5;120m\]'
      COLOR_BLUE='\[\033[38;5;39m\]'
      COLOR_RESET='\[\033[0m\]'

      __simple_prompt() {
          local dir_name="\W"
          local branch=$(git branch --no-color 2>/dev/null | awk '/^\*/ {print $2}')

          if [ -n "$branch" ]; then
              # Prompt with Git: (branch) dir >
              PS1=" ''${COLOR_ORANGE}($branch) ''${COLOR_GREEN}''${dir_name} ''${COLOR_BLUE}>''${COLOR_RESET} "
          else
              # Prompt without Git: dir >
              PS1=" ''${COLOR_GREEN}''${dir_name} ''${COLOR_BLUE}>''${COLOR_RESET} "
          fi
      }

      PROMPT_COMMAND=__simple_prompt
    '';
  };

  programs.vscode = {
    enable = true;
    mutableExtensionsDir = true;

    profiles.default.extensions = with pkgs.vscode-extensions; [
      vscodevim.vim
      yzhang.markdown-all-in-one
      jnoortheen.nix-ide
      kamadorueda.alejandra
      bradlc.vscode-tailwindcss
    ];
  };

  # This value determines the home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update home Manager without changing this value. See
  # the home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "25.11";
}
