{ pkgs, ... }: {
  environment = {
    systemPackages = with pkgs; [

  #####################################
  #  Android Utilities
  #####################################

      # adbfs-rootless          # Mount Android phones on Linux with adb, no root required
      # haskellPackages.adb     # Android Debug Bridge (ADB) protocol
      # android-tools           # Android SDK platform tools
      # android-file-transfer   # Reliable MTP client with minimalistic UI
      # droidcam                # Linux client for DroidCam app
      # scrcpy                  # Display and control Android devices over USB or TCP/IP
      # waydroid                # Waydroid is a container-based approach to boot a full Android system on a regular GNU/Linux system
    ];
  };
}
