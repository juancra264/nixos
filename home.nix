{ config, pkgs, ... }:

{
  # Change 'yourusername' and the home directory path
  home.username = "juanramirez";
  home.homeDirectory = "/home/juanramirez";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new release introduces backwards
  # incompatible changes.
  home.stateVersion = "23.11"; 

  # Install user-specific packages
  home.packages = with pkgs; [
    htop
    git
    fastfetch
    kitty
  ];

  # Manage dotfiles directly in Nix
  programs.git = {
    enable = true;
    userName = "juancra264";
    userEmail = "juancra264@hotmail.com";
  };

  # Enable Home Manager
  programs.home-manager.enable = true;
}
