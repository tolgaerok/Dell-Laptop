{ pkgs, ... }: {

  # Development and Version Control:....

  environment = {
    systemPackages = with pkgs; [

  #####################################
  # Development and Version Control:
  #####################################      

      direnv        # A shell extension that manages your environment
      graalvm17-ce  # High-Performance Polyglot VM
      mosh          # Mobile shell (ssh replacement)
      nix-direnv    # A fast, persistent use_nix implementation for direnv
      nixfmt        # An opinionated formatter for Nix
      nixos-option
      sublime4      # Sophisticated text editor for code, markup and prose
     # vscode # conflicts with vscode-with-extensions as this is just a stand alone
     # vscode-extensions.mkhl.direnv
     # vscode-extensions.brettm12345.nixfmt-vscode
      
    ];
  };
}
