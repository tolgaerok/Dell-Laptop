{ pkgs, ... }: {

  environment = {
    systemPackages = with pkgs; [

  #####################################
  # Text Editors and Utilities:
  #####################################

      kate
      libkate          # A library for encoding and decoding Kate streams
      libsForQt5.kate  # Advanced text editor
      vim              # The most popular clone of the VI editor

    ];
  };
}
