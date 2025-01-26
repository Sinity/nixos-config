{ pkgs, config, inputs, lib, ... }: 

let
  factorio-auth = pkgs.factorio.override {
    username = "Sinityy";
    token = "f59bc437802bf3d7ad8a4d83cd3de7";
  };
in 
{
  home.packages = with pkgs;[
    steam-tui
    steam-run

    factorio-auth
    # prismlauncher # minecraft

    ## Cli games
    _2048-in-terminal
    vitetris
    nethack
    
    ## Celeste
    celeste-classic
    celeste-classic-pm

    ## Doom
    # gzdoom
    crispy-doom

    ## Emulation
    sameboy
    snes9x
    # cemu
    # dolphin-emu
  ];

  # programs.steam = {
  #   enable = true;
  #   protontricks.enable = true;
  # };
  # programs.gamemode.enable = true;
  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
    "steam"
    "steam-original"
    "steam-runtime"
  ];
}
