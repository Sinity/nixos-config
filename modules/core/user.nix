{ pkgs, inputs, username, host, ...}:
{
  imports = [ inputs.home-manager.nixosModules.home-manager ];
  home-manager = {
    useUserPackages = true;
    useGlobalPkgs = true;
    backupFileExtension = "backup";
    extraSpecialArgs = { inherit inputs username host; };
    users.${username} = {
      imports = [ ./../home/default.nix ];
      home.username = "${username}";
      home.homeDirectory = "/home/${username}";
      home.stateVersion = "24.05";
      programs.home-manager.enable = true;
    };
  };
  
  users.mutableUsers = false;
  users.users.${username} = {
    isNormalUser = true;
    extraGroups = [ "networkmanager" "wheel" "users" "video" ];
    shell = pkgs.zsh;
    hashedPassword = "$y$j9T$EE/EN4Ifgi/859ru4tQxQ.$4h7Cv885iNyHz3pjhjubW3DZqMVb9wLuAunKGKE1qFC";
  };
  nix.settings.allowed-users = [ "${username}" ];
  users.users.root = {
    shell = pkgs.zsh;
    home = "/root";
    hashedPassword = "$y$j9T$S.QFCdxUUIlKBf6jlfsvq.$HAW7J8VmGgLXS7lONDpKq/p4tZRzpooROQgeo6iXYu6"; 
  };
}
