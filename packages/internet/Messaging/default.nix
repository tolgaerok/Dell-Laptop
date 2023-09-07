{ pkgs, ... }:
{

  environment = {
    systemPackages = with pkgs; [
    
  #####################################
  # Messaging and Communication:
  #####################################

      discord                    # All-in-one cross-platform voice and text chat for gamers
     # whatsapp-for-linux        # Whatsapp desktop messaging app

    ];
  };
}
