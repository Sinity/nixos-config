{ pkgs, host, ... }: 
{
  networking = {
    hostName = "${host}";
    networkmanager.enable = true;
    nameservers = [ "1.1.1.1#one.one.one.one" "8.8.8.8" ];
    firewall.enable = false;
  };

  services = {
    resolved = {
      enable = true;
      dnssec = "allow-downgrade";
      domains = [ "~." ];
      fallbackDns = [ "1.1.1.1#one.one.one.one" "8.8.8.8" ];
      dnsovertls = "true";
    };

    openssh = {
      enable = true;
      startWhenNeeded = true;
      settings = {
        PermitRootLogin = "yes";
        PasswordAuthentication = true;
        LogLevel = "VERBOSE";
      };
    };

    mullvad-vpn = {
      enable = true;
      package = pkgs.mullvad-vpn;
    };
  };

  programs.mosh.enable = true;

  environment.systemPackages = with pkgs; [
    networkmanagerapplet
    # cloudflare-warp # Free VPN; "Replaces the connection between your device and the Internet with a modern, optimized, protocol"
    mullvad-closest # benchmark latency to Mullvad relays
  ];
}
