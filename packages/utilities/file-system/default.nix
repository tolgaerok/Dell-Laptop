{ pkgs, ... }: {
  #---------------------------------------------------------------------
  # File Systems and Archiving:
  #---------------------------------------------------------------------

  environment = {
    systemPackages = with pkgs; [

      libarchive                      # Multi-format archive and compression library
      libbtbb                         # Bluetooth baseband decoding library

      libnotify                       # A library that sends desktop notifications to a notification daemon
      #-------------------------------------------------------------------
      # Desktop Notify agent example:
      #notify-send --icon=fcitx --app-name="DONE" "Fonts folder copied into $(whoami)" "$font_dest" -u normal
      #-------------------------------------------------------------------
   
      notify-desktop                  # Little application that lets you send desktop notifications with one command
      #-------------------------------------------------------------------
      # Desktop Notify agent example:
      # notify-desktop --icon=call-start "Incoming call"
      #
      # SOURCE: https://github.com/nowrep/notify-desktop/tree/master
      #-------------------------------------------------------------------
    ];
  };
}
