{ config, lib, pkgs, ... }:
{
  imports =
  [
   # ./teamviewer.nix
  ];

  environment = {
    systemPackages = with pkgs; [
      # Remote Access & Deployment
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
