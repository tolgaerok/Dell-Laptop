{ pkgs, ... }: {

  environment = {
    systemPackages = with pkgs; [

      # Samba and Networking:

      samba4Full          # The standard Windows interoperability suite of programs for Linux and Unix
      cifs-utils          # Tools for managing Linux CIFS client filesystems

    ];
  };
}
