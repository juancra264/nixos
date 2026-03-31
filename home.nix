{ config, pkgs, ... }:

{
  home.username = "juanramirez";
  home.homeDirectory = "/home/juanramirez";
  home.stateVersion = "25.11"; 

  programs.git = {
    enable = true;
    userName = "juancra264";
    userEmail = "juancra264@hotmail.com";
  };

  programs.zsh = {
    enable = true;
    ohMyZsh = {
      enable = true;
      theme = "robbyrussell";
      plugins = [ "git" "zsh-autosuggestions" ];
    };
  };

  services.netbird = {
    enable = true;
  };

  services.pcscd = {
    enable = true;
  }

  programs.home-manager.enable = true;

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
}
