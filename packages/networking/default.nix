{ config, lib, pkgs, ... }:
{

  environment = {
    systemPackages = with pkgs; [

  #####################################
  # Samba and Networking:
  #####################################

      samba4Full          # The standard Windows interoperability suite of programs for Linux and Unix
      cifs-utils          # Tools for managing Linux CIFS client filesystems

  #-------------------------------------
  # Add the required packages for iwd backend
  #-------------------------------------
    iwd                   # Wireless daemon for Linux
    # iwd-tools
  #-------------------------------------
  # Network Testing and Monitoring:
  #-------------------------------------
      doppler             # The official CLI for interacting with your Doppler Enclave secrets and configuration
      ookla-speedtest     # Command line internet speedtest tool by Ookla
  #-------------------------------------
  # Remote Access and Automation:
  #-------------------------------------
      heroku              # Everything you need to get started using Heroku
      openssh             # An implementation of the SSH protocol
      powershell          # Powerful cross-platform (Windows, Linux, and macOS) shell and scripting language based on .NET
      sshpass             # Non-interactive ssh password auth
      teamviewer          # Desktop sharing application, providing remote support and online meetings
      # nomachine-client  # NoMachine remote desktop client (nxplayer)
    ];
  };

  services.teamviewer.enable = true;
}
