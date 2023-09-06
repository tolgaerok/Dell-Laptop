{ pkgs, ... }: {
  environment = {
    systemPackages = with pkgs; [

<<<<<<< Updated upstream
  #####################################
  # Multimedia Utilities
  #####################################
=======
  # Multimedia Utilities
>>>>>>> Stashed changes

      audacity                 # Sound editor with graphical UI
      ffmpeg                   # A complete, cross-platform solution to record, convert and stream audio and video
      ffmpegthumbnailer        # A lightweight video thumbnailer
      libdvdcss                # A library for decrypting DVDs
      libdvdread               # A library for reading DVDs
      libopus                  # Open, royalty-free, highly versatile audio codec
      libvorbis                # Vorbis audio compression reference implementation
      mediainfo                # Supplies technical and tag information about a video or audio file
      mpg123                   # Fast console MPEG Audio Player and decoder library
      mplayer                  # A movie player that supports many video formats
      mpv                      # General-purpose media player, fork of MPlayer and mplayer2
      ocamlPackages.gstreamer  # Bindings for the GStreamer library which provides functions for playning and manipulating multimedia streams
      pulseaudioFull           # Sound server for POSIX and Win32 systems
      simplescreenrecorder     # A screen recorder for Linux
      video-trimmer            # Trim videos quickly

    ];
  };
}
