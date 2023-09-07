{ pkgs, ... }:
{
  environment = {
    systemPackages = with pkgs; [

  #####################################
  # Miscellaneous:
  #####################################

      flatpak                    # Linux application sandboxing and distribution framework 
      libsForQt5.kweather        # Weather application for Plasma Mobile
      libsForQt5.kweathercore    # Library to facilitate retrieval of weather information including forecasts and alerts
      variety                    # A wallpaper manager for Linux systems
      fish                       # Smart and user-friendly command line shell
      cowsay                     # A program which generates ASCII pictures of a cow with a message
      fortune                    # uA program that displays a pseudorandom message from a database of quotations  
      lolcat                     # "lolcat" for colorful output
                                 #------------------------------------
                                 # Examples: fortune | cowsay -f tux
                                 #           fortune | cowsay -e ^^
                                 #           fortune | cowsay | lolcat
                                 #------------------------------------
      papirus-icon-theme         #Papirus icon theme
      themechanger               #A theme changing utility for Linux

    ];
  };
}
