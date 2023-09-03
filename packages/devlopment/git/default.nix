{pkgs, ...}: {

  environment = {
    systemPackages = with pkgs; [ 

  #####################################
  # Github related
  #####################################

      # git-extras # GIT utilities -- repo summary, repl, changelog population, author commit percentages and more
      # git-my     # List remote branches if they're merged and/or available locally
      # gitg       # GNOME GUI client to view git repositories
      # gitless    # Version control system built on top of Git
      # gitlint    # Linting for your git commit messages
      # glab       # GitLab CLI tool bringing GitLab to your command line
      # gh         # GitHub CLI tool
      #------------------------------------------------------------------------------------------------------------
      # gitfull provides: git-credential-libsecret, git, scalar, git-receive-pack, git-shell, git-upload-pack, gitk, 
      #                    git-cvsserver, git-http-backend git-upload-archive git-jump git-credential-netrc
      #------------------------------------------------------------------------------------------------------------
      gitFull      # Distributed version control system
      gitlab       # GitLab Community Edition
      hut          # A CLI tool for Sourcehut / sr.ht
      tig          # Text-mode interface for git

    ];
  };
}