{ pkgs, ... }:
{

  environment = {
    systemPackages = with pkgs; [
    
  #####################################
  # Messaging and Communication:
  #####################################

      discord                    # All-in-one cross-platform voice and text chat for gamers
     # whatsapp-for-linux        # Whatsapp desktop messaging app
      telegram-desktop           # Telegram Desktop messaging app
      element-desktop-wayland    # A feature-rich client for Matrix.org for Wayland
     # element-desktop            # A feature-rich client for Matrix.org
     # caprine-bin                # An elegant Facebook Messenger desktop app

      betterbird                 # Betterbird is a fine-tuned version of Mozilla Thunderbird, Thunderbird on steroids, if you will

    ];
  };
}
