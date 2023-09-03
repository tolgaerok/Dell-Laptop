{ pkgs, ... }: {

  #---------------------------------------------------------------------
  # File Management:
  #---------------------------------------------------------------------

  environment = {
    systemPackages = with pkgs; [

  #---------------------------------------------------------------------
  # File Management:
  #---------------------------------------------------------------------

      # USB and Device Utilities
      usbutils                        # Tools for working with USB devices, such as lsusb

      # XDG and File Managers
      xdg-desktop-portal-gtk3         # Desktop integration portals for sandboxed apps
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

  #---------------------------------------------------------------------
  # File Systems and Archiving:
  #---------------------------------------------------------------------

      # Libraries
      libarchive                      # Multi-format archive and compression library
      libbtbb                         # Bluetooth baseband decoding library

      libnotify                       # A library that sends desktop notifications to a notification daemon
      #-------------------------------------------------------------------
      # Desktop Notify agent example:
      #notify-send --icon=fcitx --app-name="DONE" "Fonts folder copied into $(whoami)" "$font_dest" -u normal
      #-------------------------------------------------------------------
   
      notify-desktop                  # Little application that lets you send desktop notifications with one command
      #-------------------------------------------------------------------
      # Desktop Notify agent example:
      # notify-desktop --icon=call-start "Incoming call"
      #
      # SOURCE: https://github.com/nowrep/notify-desktop/tree/master
      #-------------------------------------------------------------------

  # ---------------------------------------------------------------------
  # File Transfer:
  # ---------------------------------------------------------------------
      filezilla          # Graphical FTP, FTPS and SFTP client
      libfilezilla       # A modern C++ library, offering some basic functionality to build high-performing, platform-independent programs
      rsync              # Fast incremental file transfer utility
      transmission-gtk   # A fast, easy and free BitTorrent client
      onedrive           # A complete tool to interact with OneDrive on Linux
      megasync           # Easy automated syncing between your computers and your MEGA Cloud Drive
      rclone             # Command line program to sync files and directories to and from major cloud storage
      rclone-browser     # Graphical Frontend to Rclone written in Qt
    ];
  };
}
