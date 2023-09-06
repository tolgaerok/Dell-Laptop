{ pkgs, ... }: {

  #####################################
  # Database related
  #####################################

  environment = {
    systemPackages = with pkgs;
      with libsForQt5; [
        dbeaver         # Universal SQL Client. Supports MySQL, PostgreSQL, MariaDB, SQLite, and more
        pgmodeler       # A database modeling tool for PostgreSQL
        sqlitebrowser   # DB Browser for SQLite
      ];
  };
}
