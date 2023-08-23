{ pkgs, ... }:
{
  #---------------------------------------------------------------------
  # Office and Productivity:
  #---------------------------------------------------------------------

  environment = {
    systemPackages = with pkgs; [

      # Office suite
      wpsoffice
      libreoffice-fresh
      onlyoffice-bin

      # Desktop accessories
      deepin.deepin-calculator

    ];
  };
}
