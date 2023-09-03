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

    ];
  };
}
