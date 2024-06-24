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
    name = "Catppuccin-${lib.mkUpper flavour}-${lib.mkUpper accent}-Cursors";
    package = pkgs.catppuccin-cursors."${flavour}${lib.mkUpper accent}";
    gtk.enable = true;
    size = config.catnerd.cursor.size;
  };
}