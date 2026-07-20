# My NixOS Configuration

Personal, modular NixOS configuration optimized for a single-laptop workstation setup.

This configuration uses:

- **Nix Flakes** for reproducible system builds and dependency lock files.
- **Home Manager** for managing user environment, tools, and dotfiles.
- **i3 Window Manager** as the desktop manager layer.

---

## 🛠️ Rebuild & Update Guide

Always run these commands from the repository directory (`~/.my-nixos`):

### Rebuild and Apply Changes

```bash
sudo nixos-rebuild switch --flake .#nixos
```

### Update Flake Inputs (Dependencies)

```bash
nix flake update
```

### Run Format Checks

```bash
nix flake check
```

### Format Code manually

```bash
nix fmt
```

---

## 📂 Repository Structure

The layout is organized cleanly by concerns:

- **`flake.nix`**: Entry point. Centralizes the `username` and `hostname` values, configures SpecialArgs, imports modules, and defines formatters/checks.
- **`hosts/nixos/`**: Host-specific configuration and auto-generated `hardware-configuration.nix`.
- **`modules/`**: Shared configuration components:
  - **`modules/system/`**: System-level configurations (bootloader, sound, networking, user definitions, and `diagnostics.nix` base tools).
  - **`modules/desktop/`**: Desktop environment, display manager (`ly`), and X11 settings.
    - **`modules/desktop/packages/`**: Desktop applications (GUI tools, browser declarations, fonts).
  - **`modules/development/`**: Development packages, databases, infrastructure (Docker), and tool groups.
  - **`modules/home/`**: Home Manager settings for shell config (`fish`), shortcuts, theming, and app-specific configurations.

---

## 🔍 Key Packages & Troubleshooting Tools

A set of system diagnostics and network utility tools is integrated globally (`modules/system/diagnostics.nix`) for recovery and administration:

- **Hardware/PCI/USB info**: `pciutils`, `usbutils`, `lshw`, `hwinfo`, `inxi`, `dmidecode`, `smartmontools`, `nvme-cli`.
- **Networking**: `ethtool`, `curl`, `wget`.
- **System Monitoring**: `btop`, `psmisc`.
- **Daily Utilities**: `file`, `tree`, `unzip`, `zip`, `p7zip`, `jq`, `yq-go`, `ripgrep`, `fd`, `bat`, `eza`, `fzf`, `fastfetch`.

---

## ⚙️ Configuration Rules 

- **No Multi-Host Over-engineering**: Designed exclusively for a single laptop.
- **No Hardcoded Values**: Common values such as the primary username (`fukukita`) and hostname (`nixos`) are defined once in `flake.nix` and passed down to all modules.
