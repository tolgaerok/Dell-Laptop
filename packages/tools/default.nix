{ pkgs, ... }: {
  environment = {
    systemPackages = with pkgs; [

<<<<<<< Updated upstream
  #####################################
  # system tools
  #####################################

      isoimagewriter   # ISO Image Writer is a tool to write a .iso file to a USB disk.
      keepassxc        # Offline password manager with many features.
=======

  # system tools

      isoimagewriter   # ISO Image Writer is a tool to write a .iso file to a USB disk.
     # keepassxc        # Offline password manager with many features.
      media-downloader # A Qt/C++ GUI front end to youtube-dl
>>>>>>> Stashed changes
      testdisk-qt      # Data recovery utilities
      xscreensaver     # A set of screensavers
                       #---------------------------------------------
      ventoy-full      # A New Bootable USB Solution
                       # provides:  ventoy-plugson, ventoy-persistent 
                       # ventoy-extend-persistent, ventoy-web, ventoy
                       #---------------------------------------------
    ];
  };
}
