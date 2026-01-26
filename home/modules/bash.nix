{
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
}
