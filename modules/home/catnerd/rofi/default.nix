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
    theme = "${pkgs.catnerd.catppuccin-rofi.override { inherit flavour accent; }}";

    font = "${config.catnerd.fonts.main.family} Nerd Font ${builtins.toString config.catnerd.fonts.main.size}";
  };
}