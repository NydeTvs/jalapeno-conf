{ config, pkgs, ... }:

# This file provides network rules that enforces your security and reduces the risk of exposition in internet

# Warning : some blocking rules may interfer with features
{
  networking = {
    networkmanager = {
      enable = true;
      wifi.macAddress = "stable";
    };

    nftables.enable = true;
    
    firewall = {
      enable = true;
      allowPing = false; 
      allowedTCPPorts = [];  
      allowedUDPPorts = [];
      checkReversePath = "loose";
    };
  };

  # DNS-over-TLS
  services.resolved = {
    enable = true;
    settings = {
      Resolve = {
        DNSSEC = "allow-downgrade";
        Domains = [ "~." ];
        FallbackDNS = [ "1.1.1.1" "9.9.9.9" ];
        DNSOverTLS = "opportunistic";
        DNSStubListener= "no";
      };
    };
  };

  # Kernel Enforcement
  boot.kernel.sysctl = {
    # SYN flood protection
    "net.ipv4.tcp_syncookies" = 1;

    # IP spoofing protection
    "net.ipv4.conf.all.rp_filter" = 2;
    "net.ipv4.conf.default.rp_filter" = 2;

    # Allow internal packet routing
    "net.ipv4.ip_forward" = 1;
    "net.ipv6.conf.all.forwarding" = 1;

    # Ignore ICMP redirections
    "net.ipv4.conf.all.accept_redirects" = 0;
    "net.ipv4.conf.default.accept_redirects" = 0;
    "net.ipv4.conf.all.secure_redirects" = 0;
    "net.ipv4.conf.default.secure_redirects" = 0;
    "net.ipv6.conf.all.accept_redirects" = 0;
    "net.ipv6.conf.default.accept_redirects" = 0;

    # Do not send ICMP redirections
    "net.ipv4.conf.all.send_redirects" = 0;
    "net.ipv4.conf.default.send_redirects" = 0;
  };
}
