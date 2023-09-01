{pkgs, ...}: {
  environment = {
    systemPackages = with pkgs; [
      
      libreoffice-fresh

      #--------------------------------------------------------------------------------------------------------
      # Plain-text file notepad and todo-list manager with markdown support and Nextcloud/ownCloud integration
      #--------------------------------------------------------------------------------------------------------    
      qownnotes

      #--------------------------------------------------------------------------------------------------------
      # Collect, organize, cite, and share your research sources
      #--------------------------------------------------------------------------------------------------------  zotero 
      qnotero # Quick access to Zotero references
      
      onlyoffice-bin
      
      wpsoffice     

      deepin.deepin-calculator
      galculator
      speedcrunch
    ];
  };
}
