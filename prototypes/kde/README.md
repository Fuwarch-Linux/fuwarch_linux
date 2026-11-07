# Protótipo KDE — Fuwarch Kawaii Mocha

Primeiro artefato visual do Fuwarch Linux: esquema de cores para KDE Plasma 6
baseado em **Catppuccin Mocha** com acentos rosa (`#f5c2e7`) e mauve
(`#cba6f7`), seguindo as diretrizes do doc 01 (D-003).

## Conteúdo

| Arquivo | Destino no sistema |
|---|---|
| `colors/FuwarchKawaiiMocha.colors` | `~/.local/share/color-schemes/` |
| `konsole/FuwarchKawaii.colorscheme` | `~/.local/share/konsole/` |
| `konsole/Fuwarch.profile` | `~/.local/share/konsole/` |

## Instalar e aplicar (máquina de teste)

```bash
./install.sh                      # instala em ~/.local (não altera o tema atual)
plasma-apply-colorscheme FuwarchKawaiiMocha   # aplica (Mudança imediata)
```

## Reverter

```bash
plasma-apply-colorscheme BreezeDark   # tema anterior da máquina de dev
```

## Escopo do protótipo (o que NÃO está incluído ainda)

- Look-and-feel completo (wallpaper, splash, cursor) — Fase 1.
- Tema SDDM — Fase 1.
- Fonte M PLUS Rounded (pendência P-005) — instalar manualmente para testar.
- Starship.toml — próximo passo do protótipo de terminal.
- No ISO final, estes arquivos serão distribuídos via `/etc/skel` +
  pacote do fuwarch-core, não via install.sh.
