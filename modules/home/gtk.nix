{ pkgs, config, ... }:
{
  gtk = {
    enable = true;
    # font = {
    #   name = "FiraCode Nerd Font";
    #   size = 12;
    # };
    theme = {
      name = "Gruvbox-Dark";
      package = pkgs.gruvbox-gtk-theme.override {
        colorVariants = [ "dark" ];
      };
    };
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme.override {
        color = "black";
      };
    };
    cursorTheme = {
      name = "Bibata-Modern-Ice";
      package = pkgs.bibata-cursors;
      size = 24;
    };
  };
  
  home.pointerCursor = {
    name = "Bibata-Modern-Ice";
    package = pkgs.bibata-cursors;
    size = 24;
  };

  # fonts.fontconfig.enable = true;
  # home.packages = with pkgs; [
  #   (nerdfonts.override { fonts = [ "JetBrainsMono" "FiraCode" "NerdFontsSymbolsOnly" ]; })
  #   twemoji-color-font
  #   noto-fonts-emoji
  # ];
}
