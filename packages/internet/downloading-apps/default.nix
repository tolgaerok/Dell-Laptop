{ pkgs, ... }: {

  environment = {
    systemPackages = with pkgs; [
      
  #####################################
  # Downloading and Retrieving Files:
  #####################################

      clipgrab   # Video downloader for YouTube and other sites
      wget       # Tool for retrieving files using HTTP, HTTPS, and FTP

    ];
  };
}
