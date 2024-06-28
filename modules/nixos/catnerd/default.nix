{ ...
}:

{
  imports = [
    ./_globals
    ./font
    ./grub
    ./plymouth
    ./tty
  ];

  home-manager.useGlobalPkgs = true;
}