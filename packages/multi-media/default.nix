{ pkgs, ... }: {

  environment = {
    systemPackages = with pkgs; [

  #####################################
  # Media and Entertainment:
  #####################################

      vlc                        # Cross-platform media player and streaming server
      youtube-dl                 # Command-line tool to download videos from YouTube.com and other sites
      media-downloader           # A Qt/C++ GUI front end to youtube-dl

      # Picture manger         
      digikam                    # Photo Management Program
      shotwell                   # Popular photo organizer for the GNOME desktop
 
      gimp-with-plugins          # The GNU Image Manipulation Program
      inkscape-with-extensions   # Vector graphics editor
      blender                    # 3D Creation/Animation/Publishing System

      #brasero                   # A Gnome CD/DVD Burner

    ];
  };
}


