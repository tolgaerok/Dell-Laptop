{pkgs, ...}: {
  environment = {
    systemPackages = with pkgs; [
      
  #####################################
  # Libreoffice & OpenOffice
  #####################################
      qnotero             # Quick access to Zotero references
      onlyoffice-bin      # Office suite that combines text, spreadsheet and presentation editors allowing to create, view and edit local documents
      
      wpsoffice           # Office suite, formerly Kingsoft Office

  #####################################
  # Desktop Accessories
  #####################################
      galculator               # A GTK 2/3 algebraic and RPN calculator
      speedcrunch              # A fast power user calculator

  #####################################
  # Messaging and Communication:
  #####################################
      telegram-desktop           # Telegram Desktop messaging app
      element-desktop-wayland    # A feature-rich client for Matrix.org for Wayland

      betterbird                 # Betterbird is a fine-tuned version of Mozilla Thunderbird, Thunderbird on steroids, if you will

  #####################################
  # Media & Graphics
  #####################################
      inkscape-with-extensions   # Vector graphics editor
      blender                    # 3D Creation/Animation/Publishing System      

  # ---------------------------------------------------------------------
  # File Transfer / Management:
  # ---------------------------------------------------------------------
      onedrive           # A complete tool to interact with OneDrive on Linux
      megasync           # Easy automated syncing between your computers and your MEGA Cloud Drive
      rclone             # Command line program to sync files and directories to and from major cloud storage
      rclone-browser     # Graphical Frontend to Rclone written in Qt

  # ---------------------------------------------------------------------
  # Terminal Utilities
  # ---------------------------------------------------------------------
      btop              # A monitor of resources
      meld              # Visual diff and merge tool
      libsForQt5.dolphin-plugins
    ];
  };
}