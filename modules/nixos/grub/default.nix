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
  config.boot.loader.grub = lib.mkIf config.catnerd.enable {
    theme = "${pkgs.catppuccin-grub.override { inherit flavour accent; }}";
    splashImage = pkgs.catppuccin-splash.override { inherit flavour accent; };

    font = "${pkgs.nerdfonts}/share/fonts/opentype/NerdFonts/${config.catnerd.fonts.mono.family}NerdFontMono-Regular.otf";
    fontSize = config.catnerd.fonts.mono.size;
  };
}