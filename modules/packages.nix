{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    vim
    git

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
    fastfetch
    file
    jq
    stow
    tree

    pciutils
    usbutils
  ];
}
