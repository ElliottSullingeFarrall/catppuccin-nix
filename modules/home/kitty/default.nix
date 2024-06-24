{ config
, lib
, pkgs
, ...
}:

let
  flavour = config.catnerd.flavour;
in
{
  config.programs.kitty = lib.mkIf config.catnerd.enable {
    theme = "Catppuccin-${lib.mkUpper flavour}";

    font = {
      package = pkgs.nerdfonts;
      name = "${config.catnerd.fonts.mono.family} Nerd Font";
      size = config.catnerd.fonts.mono.size;
    };
  };
}