{ pkgs, ... }:
{
  # Messaging and Communication:
  environment = {
    systemPackages = with pkgs; [
      discord
     # whatsapp-for-linux
      telegram-desktop
      element-desktop
      caprine-bin

      thunderbird
    ];
  };
}
