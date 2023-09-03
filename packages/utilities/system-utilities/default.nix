{ pkgs, ... }: {

  environment = {
    systemPackages = with pkgs; [

  #####################################
  # system Utilities:
  #####################################
  
      # ---------------------------------------------------------------------
      # Disk Utilities
      # ---------------------------------------------------------------------

      gparted  # Graphical disk partitioning tool
      ntfs3g   # FUSE-based NTFS driver with full write support
      hw-probe # Probe for hardware, check operability and find drivers
               #---------------------------------------------------------
               #  to use:   sudo -E hw-probe -all -upload
               #---------------------------------------------------------

      # ---------------------------------------------------------------------
      # Terminal Utilities
      # ---------------------------------------------------------------------

      asunder           # A graphical Audio CD ripper and encoder for Linux
      bashInteractive   # GNU Bourne-Again Shell, the de facto standard shell on Linux (for interactive use)
      cmatrix           # Simulates the falling characters theme from The Matrix movie
      delta             # A syntax-highlighting pager for git
      direnv            # A shell extension that manages your environment
      duf               # Disk Usage/Free Utility
      fd                # A simple, fast and user-friendly alternative to find
      figlet            # Program for making large letters out of ordinary text
      btop              # A monitor of resources
      imagemagick       # A software suite to create, edit, compose, or convert bitmap images
      inotify-tools     # inotifywait   inotifywatch    https://github.com/inotify-tools/inotify-tools/wiki
      less              # A more advanced file pager than ‘more’
      lf                # A terminal file manager written in Go and heavily inspired by ranger
      lfs               # Get information on your mounted disks
      lsd               # The next gen ls command
      lsdvd             # Display information about audio, video, and subtitle tracks on a DVD
      ncdu              # Disk usage analyzer with an ncurses interface
      neofetch          # A fast, highly customizable system info script
      parallel-full     # Shell tool for executing jobs in parallel
      pciutils          # A collection of programs for inspecting and manipulating configuration of PCI devices
      pfetch            # A pretty system information tool written in POSIX sh
      pkgconfig         # A tool that allows packages to find out information about other packages (wrapper script)
      pmutils           # A small collection of scripts that handle suspend and resume on behalf of HAL
      psmisc            # A set of small useful utilities that use the proc filesystem (such as fuser, killall and pstree)
      stow              # A tool for managing the installation of multiple software packages in the same run-time directory tree
      tldr              # Simplified and community-driven man pages
      tree              # Command to produce a depth indented directory listing
      gnome.zenity      # Tool to display dialogs from the commandline and shell scripts

      # ---------------------------------------------------------------------
      # XDG Utilities
      # ---------------------------------------------------------------------

      xdg-launch    # A command line XDG compliant launcher and tools
      xdg-utils     # A set of command line tools that assist applications with a variety of desktop integration tasks

    ];
  };
}
