{ ... }:

#---------------------------------------------------------------------
# Tolga Erok
# 10/6/2023
# My personal NIXOS KDE configuration 
# 
# ¯\_(ツ)_/¯
#---------------------------------------------------------------------

{

  imports = [

    #---------------------------------------------------------------------
    # Laptop: Dell Latitude E6540 i7-4800MQ (8)
    #         GPU: Intel 4th Gen Core Processor / AMD ATI Radeon HD 8790M
    #         RAM: 16GiB SODIMM DDR3 Synchronous 1600 MHz
    #---------------------------------------------------------------------
    ./machines/Dell-Latitude-E6540/Dell-E6540-configuration.nix
  ];

}