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
    # Laptop: Apple MacBookPro 9,2  Intel i5-3210M (4) @ 3.100GHz
    #         GPU: Intel 3rd Gen Core processor Graphics Controller
    #---------------------------------------------------------------------
    ./machines/Apple-MacBookPro9.2/configuration.nix

    #---------------------------------------------------------------------
    # Laptop: Dell Latitude E6540   Intel Core i7-4800MQ CPU @ 2.70GHz
    #         GPU: Intel 4th Gen Core Processor / AMD ATI Radeon HD 8790M
    #---------------------------------------------------------------------
#    ./machines/Dell-Latitude-E6540/configuration.nix

  ];

}