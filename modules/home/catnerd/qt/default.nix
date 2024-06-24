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
  qt = lib.mkIf config.catnerd.enable
  {
    platformTheme = "gtk";
    style = {
      name = "Catppuccin-${lib.mkUpper flavour}-Compact-${lib.mkUpper accent}-Dark";
      package = pkgs.catppuccin-gtk.override {
        variant = flavour;
        accents = [ accent ];
        size = "compact";
        tweaks = [ "rimless" ];
      };
    };
  };
}