{pkgs, ...}: {
  environment = {
    systemPackages = with pkgs; [

  #####################################
  # Scientific Computing
  #####################################
      julia
      
    ];
  };
}
