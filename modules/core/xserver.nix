{ pkgs, username, ... }: 
{
  services = {
    xserver = {
      enable = true;
      displayManager.lightdm.enable = false;
      videoDrivers = [ "nvidia" ];
    };
  };
}
