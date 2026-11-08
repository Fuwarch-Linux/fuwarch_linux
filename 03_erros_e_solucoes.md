# 03 — Erros e Soluções

> Regra: TUDO que quebrar (bug, dependência, kernel panic, build failure)
> é registrado aqui. Agentes futuros DEVEM consultar este arquivo antes de
> repetir qualquer abordagem que falhou.

## Formato

| ID | Data | Componente | Sintoma | Causa raiz | Solução exata | Status |
|---|---|---|---|---|---|---|
| E-001 | 2026-11-06 | fontes (M PLUS Rounded) | `fc-list \| grep "M PLUS Rounded"` não encontra a fonte recém-instalada (arquivos TTF válidos) | Os TTFs estáticos de `google/fonts/ofl/mplusrounded1c` expõem o family name interno **`Rounded Mplus 1c`** (nomenclatura legada), não `M PLUS Rounded 1c` | Usar **`Rounded Mplus 1c`** em TODA config (kdeglobals, starship, wizard). Validar sempre com `fc-match "Rounded Mplus 1c"`. Referência: `prototypes/kde/README.md` | ✅ Resolvido/documentado |
| E-002 | 2026-11-07 | SDDM (Main.qml, seletor de usuários) | Greeter test-mode renderiza **tela cheia 100% preta** (brilho médio 0.0 no screenshot), SEM nenhum erro QML no log; com todos os greeters mortos o desktop volta ao normal | `QQC2.Popup` dentro do greeter: o SDDM **não é ApplicationWindow** (não há overlay), e Popup sem overlay trava o scene graph em silêncio | Substituir Popup por **dropdown em `Rectangle` puro** com `visible` toggling + MouseArea de fechamento. **NUNCA usar QQC2.Popup (nem modais QQC2 dependentes de overlay) num tema SDDM**. Diagnóstico: medir brilho do screenshot (PIL) p/ distinguir display apagado (0.0) de tema escuro normal (~30) | ✅ Resolvido/documentado |

### Exemplo de preenchimento (modelo — não é erro real)

| E-001 | 2026-11-06 | calamares | Módulo partition falha no chroot | fstab gerado sem subvol btrfs | Adicionar `subvol=@` em options + rebuild ISO | Exemplo |

## Lições arquivadas
(nenhuma ainda)
