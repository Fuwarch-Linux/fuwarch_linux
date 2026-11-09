# Fuwarch Linux — ISO build profile (Phase 1)

`archiso` profile to build the Fuwarch Linux ISO. Derived from the official `releng` (archiso 89-1).

## Structure

```
iso/fuwarch/
  profiledef.sh          # ISO metadata (name, label, publisher)
  packages.x86_64        # packages included in the ISO
  pacman.conf            # build-time pacman (core + extra + multilib)
  airootfs/              # files copied into the live ISO
  efiboot/               # UEFI boot (systemd-boot)
  grub/                  # BIOS boot (GRUB)
  syslinux/              # Legacy BIOS boot (syslinux)
  usr/                   # extra files for the live environment
```

## Build (requires root)

```bash
sudo mkarchiso -v -w /tmp/fuwarch-work -o /tmp/fuwarch-out iso/fuwarch
```

Requirements: `archiso` package installed, sudo, ~30 GB free space, and internet access to download packages.

## What's in this profile

- KDE Plasma + SDDM as the live desktop
- `linux-zen` kernel as default
- SDDM theme "Fuwarch Kawaii" at `/usr/share/sddm/themes/fuwarch-kawaii`
- Live user `fuwa` (password `fuwa`) with SDDM autologin
- zram-generator + BTRFS tools + snapper
- `calamares` + full configuration in `airootfs/etc/calamares/` (branding `fuwarch`, kawaii QSS, modules welcome/locale/keyboard/users/partition/mount/summary/finished)
- Multilib enabled in build-time `pacman.conf`

## Pending (P-004, P-005, P-006 — see `01_diretrizes_projeto.md`)

- `fuwarch-core` repo infrastructure (package signing keys)
- Packaging of M PLUS Rounded 1c font
- Real Usami artwork for SDDM avatar (currently "Fuwarch" wordmark)
