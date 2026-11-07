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
- **Arte da Usami:** assets CC BY-NC-ND 4.0 — proibido uso comercial e
  derivações (doc 01, D-010). Entra via `theme.conf: logo=`.
- **v0.1:** lista de usuários não implementada (login por campo de texto);
  sessão inicia no índice 0; sem LayoutBox de teclado. Melhorias em v0.2.
- **preview.png:** ainda não existe (metadata referencia; gerar screenshot
  do test-mode antes de publicar o tema no fuwarch-core).

## Rollback (produção)

```ini
[Theme]
Current=breeze
```
