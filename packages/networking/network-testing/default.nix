{ pkgs, ... }: {
  # Network Testing and Monitoring:
  environment = {
    systemPackages = with pkgs; [

      # Network Utilities
      doppler             # The official CLI for interacting with your Doppler Enclave secrets and configuration
      ookla-speedtest     # Command line internet speedtest tool by Ookla
      
    ];
  };
}
