{ config, pkgs, lib, ... }:

{
  home.username = "norrman";
  home.homeDirectory = "/Users/norrman";



  home.packages = with pkgs; [
    discord

    # nerd-fonts.hack
    # nerd-fonts.jetbrains-mono
    # # waybar
    # wofi
    # greetd
    # swaylock
    #  swayidle
    #  wl-clipboard
    # qt5
    # mako
    #  wofi
    #  waybar
    #  grim
    # hyprlock
    # hypridle
    # hyprpaper
    #  slurp
    # wl-clipboard
    #  # sway
    #
    # anyrun
    #  wmenu
    #  wofi
    #  neofetch
    # albert
    # walker
    # slurp
    # grim


    ## swayfx  ##
    # meson
    # wlroots
    # wayland

    #
    #



    # xdotool
    # wayland-protocols
    # pcre2
    # pango
    # scenefx
    # swaybg
    # (python311.withPackages (ps: with ps; [ requests ]))
    # scdoc
    ## /swayfx ##
  ];

  home.stateVersion = "25.05";

  programs.home-manager.enable = true;

}
