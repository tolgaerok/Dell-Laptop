{ pkgs, ... }:
{
  environment = {
    systemPackages = with pkgs; [

  # WPSoffice

      wpsoffice     

  # Desktop Accessories

      deepin.deepin-calculator
      
    ];
  };
}
