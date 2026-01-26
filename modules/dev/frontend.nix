{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    nodejs
    pnpm
    pnpm-shell-completion
  ];
}
