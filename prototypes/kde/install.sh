#!/usr/bin/env bash
# Fuwarch Linux — protótipo KDE: instalação user-level (não aplica sozinho)
# Uso: ./install.sh
set -euo pipefail

SRC="$(cd "$(dirname "$0")" && pwd)"
COLORS_DIR="$HOME/.local/share/color-schemes"
KONSOLE_DIR="$HOME/.local/share/konsole"

mkdir -p "$COLORS_DIR" "$KONSOLE_DIR"

install -m 644 "$SRC/colors/FuwarchKawaiiMocha.colors" "$COLORS_DIR/"
install -m 644 "$SRC/konsole/FuwarchKawaii.colorscheme" "$KONSOLE_DIR/"
install -m 644 "$SRC/konsole/Fuwarch.profile" "$KONSOLE_DIR/"

echo "✔ Instalado em ~/.local (user-level)."
echo "  Aplicar cores:   plasma-apply-colorscheme FuwarchKawaiiMocha"
echo "  Reverter:        plasma-apply-colorscheme BreezeDark"
echo "  Konsole:         perfil 'Fuwarch' nas configurações do Konsole"
