{
  pkgs,
  lib,
  config,
  ...
}:
let
  cfg = config.home-desktop.hyprland;
  wallpaper = pkgs.runCommand "hyprland-wallpaper.png" { nativeBuildInputs = [ pkgs.imagemagick ]; } ''
    magick -size 1920x1080 canvas:'#1b1d26' \
      -fill '#7ebae4' -draw 'polygon 757,401 809,371 1048,784 996,815' \
      -fill '#5277c3' -draw 'polygon 915,371 967,401 728,815 676,784' \
      -fill '#7ebae4' -draw 'polygon 1036,512 1036,572 558,572 558,512' \
      -fill '#5277c3' -draw 'polygon 1163,678 1111,709 872,294 924,265' \
      -fill '#7ebae4' -draw 'polygon 1005,709 953,678 1192,265 1244,294' \
      -fill '#5277c3' -draw 'polygon 884,567 884,506 1362,506 1362,567' \
      "$out"
  '';
in
{
  config = lib.mkIf cfg.enable {
    xdg.configFile."hypr/hyprpaper.conf".text = ''
      preload = ${wallpaper}
      wallpaper = ,${wallpaper}
      splash = false
    '';
  };
}
