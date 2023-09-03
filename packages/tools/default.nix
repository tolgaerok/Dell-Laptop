{ pkgs, ... }: {

  environment = {
    systemPackages = with pkgs; [

  #####################################
  # system tools
  #####################################

      isoimagewriter   # ISO Image Writer is a tool to write a .iso file to a USB disk.
      keepassxc        # Offline password manager with many features.
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
