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
  # Causes creation of ~/.icons
  config.home.pointerCursor = lib.mkIf config.catnerd.enable
  {
    name = "catppuccin-${flavour}-${accent}-cursors";
    package = pkgs.catppuccin-cursors."${flavour}${lib.catnerd.mkUpper accent}";
    gtk.enable = true;
    size = config.catnerd.cursor.size;
  };
}