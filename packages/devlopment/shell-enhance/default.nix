{ pkgs, ... }: {

  environment = {
    systemPackages = with pkgs; [

  #####################################
  # Shell Enhancements and Utilities:
  #####################################

      rPackages.fontawesome
      zsh                     # The Z shell
      zsh-autosuggestions     # Fish shell autosuggestions for Zsh
      zsh-syntax-highlighting # Fish shell like syntax highlighting for Zsh

    ];
  };
}
