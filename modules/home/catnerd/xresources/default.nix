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
  config.xresources = lib.mkIf config.catnerd.enable {
    extraConfig = "${pkgs.catppuccin-xresources.override { inherit flavour accent; }}";
  };
}