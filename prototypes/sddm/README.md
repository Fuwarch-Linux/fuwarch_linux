# Protótipo SDDM — Fuwarch Kawaii

Tema de login do Fuwarch Linux para SDDM 0.21 / Qt6. **Clean-room**: usa
apenas `QtQuick` + `SddmComponents` (módulo nativo do SDDM) — nenhum código
ou arte do tema breeze (CC-BY-SA) foi copiado. Licença: MIT.

## Testar sem reiniciar (máquina de dev)

```bash
sddm-greeter-qt6 --test-mode --theme "$HOME/fuwarch-docs/prototypes/sddm/fuwarch"
```

Abre uma janela com o greeter em modo de teste (não faz login real).

## Instalar de verdade (produção / ISO)

1. Copiar a pasta para `/usr/share/sddm/themes/fuwarch-kawaii/`.
2. Criar `/etc/sddm.conf.d/theme.conf`:

```ini
[Theme]
Current=fuwarch-kawaii
```

## ⚠️ Gotchas conhecidos

- **Fontes no greeter real:** o SDDM roda com o usuário `sddm`, que NÃO vê
  fontes em `~/.local/share/fonts`. Na ISO, a fonte precisa ser instalada
  **system-wide** (pacote no fuwarch-core). Em `--test-mode` a fonte aparece
  porque o teste roda com o usuário atual.
- **Validação visual (receita testada):** rodar com `QT_QPA_PLATFORM=xcb`
  (janela flutuante via XWayland) + capturar com
  `spectacle -b -n -o preview.png`. A janela do test-mode pode abrir SEM
  foco/atrás das outras — não assuma que falhou; verifique por screenshot.
- **Botões de energia invisíveis no test-mode:** sem daemon do SDDM,
  `sddm.canReboot`/`canPowerOff` retornam false — é o esperado; no greeter
  real eles aparecem.
- **⚠️ Caminho da logo é hardcoded da máquina de dev:**
  `file:///home/luke/Imagens/fuwarch.png`. Para produção (ISO), a logo deve
  viver DENTRO do diretório do tema e entrar via `theme.conf: logo=`, empacotada
  no fuwarch-core. `preview.png` contém arte da Usami (CC BY-NC-ND 4.0 —
  © Rukafuu, proibido uso comercial/derivações).
- **Arte da Usami:** assets CC BY-NC-ND 4.0 — proibido uso comercial e
  derivações (doc 01, D-010). Entra via `theme.conf: logo=`.
- **v0.1 (greeter de usuário):** avatar circular (OpacityMask) + nome via
  `userModel` (roles 257=name, 258=realName, 260=icon — padrão confirmado no
  tema silent-nyarch) + senha com botão seta circular. Card em glassmorphism
  com glow rosa (DropShadow do qt6-5compat — este funciona no greeter).
- **v0.2 (seletor de usuários):** chevron `⌄` ao lado do nome (só com >1
  usuário) abre **dropdown em Rectangle puro** — NUNCA `QQC2.Popup` (doc 03,
  E-002: trava o render em tela preta silenciosa). Flag `forceUserSelector`
  no `theme.conf` força o seletor para testes com 1 usuário (auto-abre para
  screenshot). Avatar continua a Usami (identidade da distro); a troca afeta
  nome/login. Ícones reais dos usuários (role 260) ficam para v0.3.
- **preview.png:** gerado via screenshot do test-mode. Contém arte da Usami
  (CC BY-NC-ND 4.0 — © Rukafuu, proibido uso comercial/derivações).

## Rollback (produção)

```ini
[Theme]
Current=breeze
```
