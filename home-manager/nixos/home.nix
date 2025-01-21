{ config, pkgs, lib, ... }:

  {


    home.packages = with pkgs; [
        nerd-fonts.hack
        nerd-fonts.jetbrains-mono
        # waybar
        wofi
        # greetd
        # swaylock
        #  swayidle
        #  wl-clipboard
        # qt5
        mako
        hyprlock
        hypridle
        hyprpaper
        # wl-clipboard
        #
        # albert
        # walker
        slurp
        grim


        # meson
        # wlroots
        #
        # xdotool
        # wayland-protocols
        # pcre2
        # pango
        # scenefx
        # swaybg
        (python311.withPackages (ps: with ps; [ requests ]))
        # scdoc
        ## /swayfx ##
      ];


    home.stateVersion = "25.05";
    
    programs.home-manager.enable = true;
  
}
