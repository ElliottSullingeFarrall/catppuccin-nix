{ config
, lib
, pkgs
, palette
, ...
}:

let
  flavour = config.catnerd.flavour;
  accent = config.catnerd.accent;
in
{
  config.wayland.windowManager.hyprland.settings = lib.mkIf config.catnerd.enable
  {
    source = [
      "${pkgs.catnerd.catppuccin-hyprland.override { inherit flavour accent; }}"
    ];
    settings = {
      env = [
        "QT_STYLE_OVERRIDE,gtk2"

        "XCURSOR_SIZE,${builtins.toString config.catnerd.cursor.size}"
      ];
    };
    misc.background_color = "rgb(${lib.catnerd.mkColour palette.${flavour}.base})";
  };
}