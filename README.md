# My NixOS Configuration

Personal NixOS configuration for my daily workstation.

This repository uses:

* Nix Flakes
* Home Manager
* i3 Window Manager

This configuration is built specifically for my own hardware, workflow, and preferences.

I'm also using this repository to learn Nix and improve my configuration over time.

## Structure

```text
hosts/
modules/
├── system/
├── desktop/
├── development/
└── home/
```

The configuration is modular to keep it easier to maintain as it grows.

## Notes

* This is **not** intended to be a universal NixOS configuration.
* It will probably require changes before it works on another machine.
* Feel free to take ideas or copy parts that are useful.

## License

MIT
