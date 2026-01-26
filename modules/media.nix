{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    # audacity
    # inkscape
    gimp
    vlc
    # kdePackages.kdenlive
    # obs-studio
  ];
}
