{ config, pkgs, options, lib, ... }:

#---------------------------------------------------------------------
# Tolga Erok
# 17/10/23
# My personal NIXOS KDE configuration 
# 
# ¯\_(ツ)_/¯
#---------------------------------------------------------------------

let
  #---------------------------------------------------------------------
  #   Auto HOST chooser based on device product name
  #   Terminal:   cat /sys/devices/virtual/dmi/id/product_name
  #---------------------------------------------------------------------
  importfile = (  if builtins.readFile "/sys/devices/virtual/dmi/id/product_name" == "Latitude E6540\n" then
   #   machines/LAPTOPS/Dell-Latitude-E6540/Dell-E6540-configuration.nix
      machines/LAPTOPS/Dell-Latitude-E6540/server.nix

    else if builtins.readFile "/sys/devices/virtual/dmi/id/product_name" == "MacBookPro9,2\n" then
      machines/LAPTOPS/Apple-MacBookPro-9.2/Apple-configuration.nix
  
  else

    # This has to be manually symlinked per host/machine
    /etc/nixos/manual.nix

  );

in

{
<<<<<<< HEAD
  imports = [ 
    
    importfile 
    
=======

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

>>>>>>> 73c17c762d1117aff4a552cf81b52ab00feffe1f
  ];
}



