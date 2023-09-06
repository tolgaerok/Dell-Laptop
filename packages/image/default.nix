{ pkgs, ... }: {
<<<<<<< Updated upstream

  environment = {
    systemPackages = with pkgs; [

  #####################################
  # Image Scanning and Processing:
  #####################################
=======
  environment = {
    systemPackages = with pkgs; [

  # Image Scanning and Processing:
>>>>>>> Stashed changes

      nsxiv          # New Suckless X Image Viewer
      sane-backends  # SANE (Scanner Access Now Easy) backends
      scanbd         # Scanner button daemon
      sxiv           # Simple X Image Viewer
      
    ];
  };
}
