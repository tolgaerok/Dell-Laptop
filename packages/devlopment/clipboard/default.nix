{ pkgs, ... }:{

  environment = {
    systemPackages = with pkgs; [

  #####################################
  # Clipboard Utilities:
  #####################################
      wl-clipboard      # Command-line copy/paste utilities for Wayland    

    ];
  };
}
