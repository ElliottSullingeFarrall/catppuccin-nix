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
  config.programs.waybar = lib.mkIf config.catnerd.enable {
    style = ''
      @import "${pkgs.catppuccin-waybar.override { inherit flavour accent; }}";
    '';
  };
}