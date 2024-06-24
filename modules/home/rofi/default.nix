{ config
, lib
, pkgs
, ...
}:

let
  flavour = config.catnerd.flavour;
  accent = config.catnerd.accent;
in
{
  config.programs.rofi = lib.mkIf config.catnerd.enable {
    theme = "${pkgs.catppuccin-rofi.override { inherit flavour accent; }}";

    font = "${config.catnerd.fonts.main.family} Nerd Font ${builtins.toString config.catnerd.fonts.mono.size}";
  };
}