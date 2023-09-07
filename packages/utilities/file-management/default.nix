{ pkgs, ... }: {

  #---------------------------------------------------------------------
  # File Management:
  #---------------------------------------------------------------------

  environment = {
    systemPackages = with pkgs; [

      # USB and Device Utilities
      usbutils                        # Tools for working with USB devices, such as lsusb

      # XDG and File Managers
      xdg-desktop-portal-gtk         # Desktop integration portals for sandboxed apps
      xfce.thunar                     # Xfce file manager
      xfce.thunar-volman              # Thunar extension for automatic management of removable drives and media
      xfce.thunar-dropbox-plugin      # A plugin that adds context-menu items for Dropbox to Thunar
      xfce.thunar-archive-plugin      # Thunar plugin providing file context menus for archives
      xfce.thunar-media-tags-plugin   # Thunar plugin providing tagging and renaming features for media files

      # Other Miscellaneous Programs
      blueberry                       # Bluetooth configuration tool
      efibootmgr                      # A Linux user-space application to modify the Intel Extensible Firmware Interface (EFI) Boot Manager
      gum                             # Tasty Bubble Gum for your shell
      krusader                        # Norton/Total Commander clone for KDE
    ];
  };
}
