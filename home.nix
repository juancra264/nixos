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
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    wget
    git
    neovim 
    tmux 
    python3  
    mtr
    ipcalc
    tlp 
    jq
    gcc  
    wget 
    bat 
    mosh 
    eza
    zsh 
    zsh-syntax-highlighting 
    zsh-autosuggestions 
    curl 
    net-tools 
    dnsutils 
    traceroute 
    nmap 
    iperf3 
    speedtest-cli
    picocom
    ncdu 
    btop 
    glances 
    bmon 
    htop
    filezilla
    kitty
    remmina
    freerdp
    teams-for-linux
    vscode
    drawio
    spotify
    brave
    yubikey-manager             # Command line tool to manage key
    yubikey-personalization     # For Udev rules
    yubioath-flutter
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
