# NIXOS operation


## Install configuration 

```bash
sudo nixos-rebuild switch
```

```bash
sudo nixos-rebuild switch --upgrade

```bash
sudo nixos-rebuild switch --flake .#default
```

```bash
sudo nixos-rebuild switch --flake .#laptop
```

```bash
sudo nixos-rebuild test
```

```bash
sudo nix-collect-garbage --delete-older-than 15d
```

```bash
nix.settings.experimental-features = [ "nix-command" "flakes"];
```
