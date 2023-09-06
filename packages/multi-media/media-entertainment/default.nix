{ pkgs, ... }:
{
  
  environment = {
    systemPackages = with pkgs; [

      # Media and Entertainment:
      vlc                        # Cross-platform media player and streaming server
      youtube-dl                 # Command-line tool to download videos from YouTube.com and other sites
    ];
  };
}
