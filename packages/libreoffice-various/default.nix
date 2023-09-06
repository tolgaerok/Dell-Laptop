{pkgs, ...}: {
  environment = {
    systemPackages = with pkgs; [

  # Libreoffice
      
      libreoffice-fresh   # Comprehensive, professional-quality productivity suite, a variant of openoffice.org

      qownnotes           # Plain-text file notepad and todo-list manager
      zotero              # Collect, organize, cite, and share your research sources
      
    ];
  };
}
