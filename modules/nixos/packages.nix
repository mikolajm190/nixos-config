{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    vim
    git

    # networking
    curl
    wget
    dnsutils

    # archives
    zip
    xz

    # monitoring
    htop

    # security
    openssl
    gnupg

    # other
    jq
    file
    tree

    pciutils
    usbutils
  ];
}
