# Fuwarch Linux — perfil do build ISO (Fase 1)

Perfil `archiso` para construir a ISO do Fuwarch Linux. Derivado do
`releng` oficial (archiso 89-1).

## Estrutura

```
iso/fuwarch/
  profiledef.sh          # metadados da ISO (nome, label, publisher)
  packages.x86_64        # pacotes que entram na ISO
  pacman.conf            # pacman do build (core + extra + multilib)
  airoootfs/             # arquivos copiados para o live ISO
  efiboot/               # boot UEFI (systemd-boot)
  grub/                  # boot BIOS (grub)
  syslinux/              # boot BIOS legado (syslinux)
```

## Build (precisa de root)

```
sudo mkarchiso -v -w /tmp/fuwarch-work -o /tmp/fuwarch-out iso/fuwarch
```

Requisitos: pacote `archiso` instalado, sudo, ~30 GB livres e internet
para baixar os pacotes.

## O que já está neste perfil

- KDE Plasma + SDDM como desktop do live
- Kernel `linux-zen` como padrão
- Tema SDDM "Fuwarch Kawaii" em `/usr/share/sddm/themes/fuwarch-kawaii`
- Live-user `fuwa` (senha `fuwa`) com autologin no SDDM
- zram-generator + BTRFS tools + snapper
- `calamares` + configuração completa em
  `airootfs/etc/calamares/` (branding `fuwarch`, QSS kawaii, módulos
  welcome/locale/keyboard/users/partition/mount/summary/finished)
- Multilib habilitado no `pacman.conf` do build

## Pendências (P-004, P-005, P-006 — ver 01_diretrizes_projeto.md)

- Infra do repo `fuwarch-core` (chaves de assinatura de pacotes)
- Empacotamento da fonte M PLUS Rounded 1c
- Arte real da Usami para o avatar do SDDM (atualmente wordmark "Fuwarch")
