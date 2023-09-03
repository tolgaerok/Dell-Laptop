{ pkgs, ... }:
{
  environment = {
    systemPackages = with pkgs; [
    
  #####################################
  # Code Search and Analysis:
  #####################################

      ripgrep      # A utility that combines the usability of The Silver Searcher with the raw speed of grep
      ripgrep-all  # Ripgrep, but also search in PDFs, E-Books, Office documents, zip, tar.gz, and more
    ];
  };
}
