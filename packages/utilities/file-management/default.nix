{ pkgs, ... }: {

  #---------------------------------------------------------------------
  # File Management:
  #---------------------------------------------------------------------

  environment = {
    systemPackages = with pkgs; [

      # USB and Device Utilities
      usbutils

      # XDG and File Managers
      xdg-desktop-portal-gtk
      xfce.thunar
      xfce.thunar-volman
      xfce.thunar-dropbox-plugin
      xfce.thunar-archive-plugin
      xfce.thunar-media-tags-plugin

      # Other Miscellaneous Programs
      blueberry
      efibootmgr
      gum
      krusader
    ];
  };
}
