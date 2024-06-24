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
  config.boot.plymouth = lib.mkIf config.catnerd.enable {
    themePackages = [
      (pkgs.catppuccin-plymouth.override { inherit flavour accent; })
    ];
    theme = "catppuccin-${flavour}";

    font = "${pkgs.nerdfonts}/share/fonts/opentype/NerdFonts/${config.catnerd.fonts.mono.family}NerdFontMono-Regular.otf";
  };
}