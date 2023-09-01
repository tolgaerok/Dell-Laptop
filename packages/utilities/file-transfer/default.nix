{ pkgs, ... }:
{
  
  
  environment = {
    systemPackages = with pkgs; [

      # File Transfer:
      filezilla
      libfilezilla
      rsync 
      transmission-gtk
      onedrive
      megasync
      rclone
      rclone-browser

    ];
  };
}
