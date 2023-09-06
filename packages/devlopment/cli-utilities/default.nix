{ pkgs, ... }: {

  environment = {
    systemPackages = with pkgs; [

  #####################################
  # Command Line Tools Utilities:
  #####################################

      bat            # A cat(1) clone with syntax highlighting and Git integration
      cliphist       # Wayland clipboard manager
      dialog         # Display dialog boxes from shell
      doas           # Executes the given command as another user
      fx             # Terminal JSON viewer
      fzf            # A command-line fuzzy finder written in Go
      vulkan-tools   # Khronos official Vulkan Tools and Utilities
      wayland-utils  # Wayland utilities (wayland-info)
 
  #####################################
  # Clipboard Utilities:
  #####################################
      cliphist       # Wayland clipboard manager
      wl-clipboard      # Command-line copy/paste utilities for Wayland
     # wl-clipboard-x11 # A wrapper to use wl-clipboard as a drop-in replacement for X11 clipboard tools

    ];
  };
}
