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
  config.xdg.configFile."hypr/hyprlock.conf" = lib.mkIf config.catnerd.enable {
    source = "${pkgs.catppuccin-hyprlock.override { inherit flavour accent; font = config.catnerd.fonts.main.family; }}";
  };

  config.xdg.configFile."background" = lib.mkIf config.catnerd.enable {
    source = pkgs.catppuccin-splash.override { inherit flavour accent; };
  };
}