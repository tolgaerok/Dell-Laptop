{ ... }:

{

  #---------------------------------------------------------------------
  # System settings
  #---------------------------------------------------------------------

  imports = [

    # ./blocker
<<<<<<< HEAD
    # ./kernel-sysctl/SSD-28GB-default.nix       # kernel tweaks for laptop with SSD & 8GB RAM
    # ./kernel-sysctl/SSD-default.nix               # kernel tweaks for laptop (General)
    # ./theme    # GNOME THEME?
    #./boot-kernel
=======
    # ./theme    # GNOME THEME?

>>>>>>> 73c17c762d1117aff4a552cf81b52ab00feffe1f
    ./bluetooth
    ./documentation
    ./env
    ./filesystem-support
    ./firewall
    ./fonts
    ./network

  ];

}
