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
  config.xdg.configFile."swaync/style.css" = lib.mkIf config.catnerd.enable {
    source = "${pkgs.catppuccin-swaync.override { inherit flavour accent; }}";
  };
}