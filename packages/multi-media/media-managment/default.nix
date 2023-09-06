{ pkgs, ... }: {

  # Media Management:
  environment = {
    systemPackages = with pkgs; [

      # Picture manger
      digikam                    # Photo Management Program
      shotwell                   # Popular photo organizer for the GNOME desktop

      # Picture Editors
      gimp-with-plugins          # The GNU Image Manipulation Program

      # Disc burner
      #brasero                   # A Gnome CD/DVD Burner

    ];
  };
}
