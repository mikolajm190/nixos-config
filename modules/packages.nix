{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    vim
    git
    thunar

    # networking
    curl
    wget
    dnsutils

    # archives
    zip
    unzip
    xz

    # monitoring
    htop

    # security
    openssl
    gnupg
    keepassxc

    # other
    jq
    file
    tree
    fastfetch

    pciutils
    usbutils
  ];
}
