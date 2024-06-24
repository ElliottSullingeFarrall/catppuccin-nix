{ config
, lib
, pkgs
, ...
}:

let
  flavour = config.catnerd.flavour;
  accent = config.catnerd.accent;

  splitAndFilter = str: lib.filter (s: s != "") (lib.splitString "\n" str);
in
{
  config.boot.kernelParams = lib.mkIf config.catnerd.enable
   (splitAndFilter (builtins.readFile "${pkgs.catppuccin-tty.override { inherit flavour accent; }}"));
}