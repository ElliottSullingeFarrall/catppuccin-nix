{ lib
, ...
}: 

{
  options.catnerd = {
    enable = lib.mkEnableOption "Enable CatNerd theming";
    
    flavour = lib.mkOption {
      type = lib.types.flavourOption;
      default = "macchiato";
      description = "Catppuccin flavour";
    };

    accent = lib.mkOption {
      type = lib.types.accentOption;
      default = "blue";
      description = "Catppuccin accent";
    };

    cursor = {
      size = lib.mkOption {
        type = lib.types.int;
        default = 24;
        description = "Cursor size";
      };
    };

    fonts = {
      main = {
        family = lib.mkOption {
          type = lib.types.mainFontOption;
          default = "Ubuntu";
          description = "Main nerdfont family";
        };
        size = lib.mkOption {
          type = lib.types.int;
          default = 10;
          description = "Main nerdfont size";
        };
      };
      mono = {
        family = lib.mkOption {
          type = lib.types.monoFontOption;
          default = "DroidSansM";
          description = "Mono nerdfont family";
        };
        size = lib.mkOption {
          type = lib.types.int;
          default = 14;
          description = "Mono nerdfont size";
        };
      };
    };
  };
}