{ pkgs, ... }: {
  environment = {
    systemPackages = with pkgs; [

  # Archive Utilities

      atool  # Archive command line helper
      gzip   # GNU zip compression program
      lz4    # Extremely fast compression algorithm
      lzip   # A lossless data compressor based on the LZMA algorithm
      lzo    # Real-time data (de)compression library
      lzop   # Fast file compressor
      p7zip  # A new p7zip fork with additional codecs and improvements (forked from https://sourceforge.net/projects/p7zip/)
      rar    # Utility for RAR archives
      rzip   # Compression program
      unzip  # An extraction utility for archives compressed in .zip format
      xz     # A general-purpose data compression software, successor of LZMA
      zip    # Compressor/archiver for creating and modifying zipfiles
      zstd   # Zstandard real-time compression algorithm

    ];
  };
}
