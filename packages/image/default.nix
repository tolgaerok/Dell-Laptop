{ pkgs, ... }: {
  environment = {
    systemPackages = with pkgs; [

  # Image Scanning and Processing:

      nsxiv          # New Suckless X Image Viewer
      sane-backends  # SANE (Scanner Access Now Easy) backends
      scanbd         # Scanner button daemon
      sxiv           # Simple X Image Viewer
      
    ];
  };
}
