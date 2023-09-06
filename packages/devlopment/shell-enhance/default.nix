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
<<<<<<< Updated upstream
      fish                    # Smart and user-friendly command line shell
      sl                      # Steam Locomotive runs across your terminal when you type 'sl'
      cowsay                  # A program which generates ASCII pictures of a cow with a message
      fortune                 # uA program that displays a pseudorandom message from a database of quotations  
      lolcat                  # "lolcat" for colorful output
                              #------------------------------------
                              # Examples: fortune | cowsay -f tux
                              #           fortune | cowsay -e ^^
                              #           fortune | cowsay | lolcat
                              #------------------------------------
=======
>>>>>>> Stashed changes

    ];
  };
}
