{pkgs, ...}: {
  environment = {
    systemPackages = with pkgs; [
      
  #####################################
  # office
  #####################################
      
      libreoffice-fresh   # Comprehensive, professional-quality productivity suite, a variant of openoffice.org

      qownnotes           # Plain-text file notepad and todo-list manager
      zotero              # Collect, organize, cite, and share your research sources
      qnotero             # Quick access to Zotero references
      
      onlyoffice-bin      # Office suite that combines text, spreadsheet and presentation editors allowing to create, view and edit local documents
      
      wpsoffice           # Office suite, formerly Kingsoft Office

      deepin.deepin-calculator # An easy to use calculator for ordinary users
      galculator               # A GTK 2/3 algebraic and RPN calculator
      speedcrunch              # A fast power user calculator
    ];
  };
}
