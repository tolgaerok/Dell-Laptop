{pkgs, ...}: {
  environment = {
    systemPackages = with pkgs; [
<<<<<<< Updated upstream
  #####################################
  # Data Science Tools
  #####################################
=======

  # Data Science Tools
>>>>>>> Stashed changes

      dvc        # Version Control System for Machine Learning Projects
      gnuplot    # A portable command-line driven graphing utility for many platforms
      iredis     # A Terminal Client for Redis with AutoCompletion and Syntax Highlighting
      litecli    # Command-line interface for SQLite
      luigi      # Python package that helps you build complex pipelines of batch jobs
      mpi        # Open source MPI-3 implementation
      quarto     # Open-source scientific and technical publishing system built on Pandoc
      root       # A data analysis framework
      visidata   # Interactive terminal multitool for tabular data
    ];
  };
}
