{ inputs, pkgs, ... }: 
{
  imports = [
    ./config.nix
    ./hyprlock.nix
  ];

  home.packages = with pkgs; [
    swaybg
    grim slurp
    grimblast
    wl-screenrec
    hyprpicker
    wl-clip-persist
    glib
    wayland
    direnv
  ];

  systemd.user.targets.hyprland-session.Unit.Wants = [ "xdg-desktop-autostart.target" ];
  
  wayland.windowManager.hyprland = {
    enable = true;
    xwayland = {
      enable = true;
    };
    systemd.enable = true;
  };

  home.sessionVariables = {
    NIXOS_OZONE_WL = "1";
    NIXPKGS_ALLOW_UNFREE = "1";
    __GL_GSYNC_ALLOWED = "0";
    __GL_VRR_ALLOWED = "0";
    _JAVA_AWT_WM_NONEREPARENTING = "1";
    SSH_AUTH_SOCK = "/run/user/1000/keyring/ssh";
    DISABLE_QT5_COMPAT = "0";
    GDK_BACKEND = "wayland";
    ANKI_WAYLAND = "1";
    DIRENV_LOG_FORMAT = "";
    WLR_DRM_NO_ATOMIC = "1";
    QT_AUTO_SCREEN_SCALE_FACTOR = "1";
    QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
    QT_QPA_PLATFORM = "xcb";
    QT_QPA_PLATFORMTHEME = "qt5ct";
    QT_STYLE_OVERRIDE = "kvantum";
    MOZ_ENABLE_WAYLAND = "1";
    # WLR_BACKEND = "vulkan";
    # WLR_RENDERER = "vulkan";
    WLR_NO_HARDWARE_CURSORS = "1";
    XDG_SESSION_TYPE = "wayland";
    SDL_VIDEODRIVER = "wayland";
    CLUTTER_BACKEND = "wayland";
    GTK_THEME = "Gruvbox-Dark";

    # LIBVA_DRIVER_NAME = "nvidia";
    # GBM_BACKEND = "nvidia-drm"; 
    # __GLX_VENDOR_LIBRARY_NAME = "nvidia";
  };
}
