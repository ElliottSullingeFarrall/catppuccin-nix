{ config
, lib
, pkgs
, ...
}:

{
  config.fonts = lib.mkIf config.catnerd.enable
  {
    fontconfig.enable = true;
    packages = with pkgs; [ nerdfonts ];
  };
}