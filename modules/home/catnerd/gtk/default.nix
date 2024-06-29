{ config
, lib
, pkgs
, ...
}:

let
  flavour = config.catnerd.flavour;
  accent = config.catnerd.accent;

  theme = {
    name = "catppuccin-${flavour}-${accent}-compact+rimless";
    package = pkgs.catppuccin-gtk.override {
      variant = flavour;
      accents = [ accent ];
      size = "compact";
      tweaks = [ "rimless" ];
    };
  };
in
{
  config.gtk = lib.mkIf config.catnerd.enable
  {
    theme = {
      name = "catppuccin-${flavour}-${accent}-compact+rimless";
      package = pkgs.catppuccin-gtk.override {
        variant = flavour;
        accents = [ accent ];
        size = "compact";
        tweaks = [ "rimless" ];
      };
    };
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.catppuccin-papirus-folders.override {
        flavor = flavour;
        accent = accent;
      };
    };
    cursorTheme = {
      name = "catppuccin-${flavour}-${accent}-cursors";
      package = pkgs.catppuccin-cursors.macchiatoPink;
      size = config.catnerd.cursor.size;
    };
    font = {
      name = "${config.catnerd.fonts.main.family} Nerd Font";
      package = pkgs.nerdfonts;
      size = config.catnerd.fonts.main.size;
    };
  };

  #TODO dark mode should be toggled based on flavour
  config.dconf = {
    enable = true;
    settings = {
      "org/gnome/desktop/interface" = {
        color-scheme = "prefer-dark";
      };
    };
  };

  config.xdg.configFile = lib.mkIf config.catnerd.enable {
    "gtk-4.0/assets".source = "${theme.package}/share/themes/${theme.name}/gtk-4.0/assets";
    "gtk-4.0/gtk.css".source = "${theme.package}/share/themes/${theme.name}/gtk-4.0/gtk.css";
    "gtk-4.0/gtk-dark.css".source = "${theme.package}/share/themes/${theme.name}/gtk-4.0/gtk-dark.css";
  };
}