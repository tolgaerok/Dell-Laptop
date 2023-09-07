{ pkgs, ... }:{
  environment = {
    systemPackages = with pkgs; [

      # File Transfer:
      filezilla          # Graphical FTP, FTPS and SFTP client
      libfilezilla       # A modern C++ library, offering some basic functionality to build high-performing, platform-independent programs
      rsync              # Fast incremental file transfer utility
      transmission-gtk   # A fast, easy and free BitTorrent client

    ];
  };
}
