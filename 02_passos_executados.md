# 02 — Passos Executados (Log Cronológico)

> Regra: registrar SOMENTE configurações/scripts/compilações já executadas e
> TESTADAS com sucesso. Testes pendentes vão marcados como `[PENDENTE]`.
> IDs de ação usam prefixo `A-` (para não colidir com pendências `P-` do doc 01).

| ID | Data | Responsável | Ação executada | Como foi validado | Arquivos/Artefatos |
|---|---|---|---|---|---|
| A-001 | 2026-11-06 | Rukafuu + Agente arquiteto | Entrevista de fundação (4 pilares) e consolidação do escopo no doc 01 v0.1 | Revisão do mantenedor — aprovado | 01_diretrizes_projeto.md |
| A-002 | 2026-11-06 | Rukafuu + Agente arquiteto | Resolução das pendências P-001/P-002/P-003 (licenças CC BY-NC-ND 4.0 + MIT; ícones Tela Circle pastel; wizard em Tauri); doc 01 → v0.2; criação do repo público `Rukafuu/fuwarch-docs` e versionamento inicial dos 4 docs + README | Push validado no GitHub (commit inicial) | 01, 02, 03, 04, README.md |
| A-003 | 2026-11-06 | Rukafuu + Agente arquiteto | Protótipo KDE "Fuwarch Kawaii Mocha": esquema de cores Plasma 6 (Catppuccin Mocha + acentos rosa/mauve), esquema de cores Konsole + perfil `Fuwarch`, e `install.sh` user-level | Instalado em `~/.local/share/{color-schemes,konsole}`; reconhecido por `plasma-apply-colorscheme --list-schemes`; **aplicado com sucesso** na sessão Plasma 6.7.4/Wayland da máquina de dev (confirmado no `kdeglobals`) | prototypes/kde/{README.md, colors/FuwarchKawaiiMocha.colors, konsole/*, install.sh} |
| A-004 | 2026-11-06 | Rukafuu + Agente arquiteto | Tema claro **FuwarchKawaiiLatte** (Catppuccin Latte + acento rosa) e validação do switch dark/light (D-003) | Aplicado Latte → confirmado no `kdeglobals` → restaurado Mocha; ambos aceitos pelo `plasma-apply-colorscheme` | prototypes/kde/colors/FuwarchKawaiiLatte.colors |
| A-005 | 2026-11-06 | Rukafuu + Agente arquiteto | Perfil Konsole `Fuwarch.profile` definido como **padrão** do Konsole | Readback do `konsolerc` confirma `DefaultProfile=Fuwarch.profile`. Rollback: `Profile 1.profile` | konsolerc (máquina de dev) |
| A-006 | 2026-11-06 | Rukafuu + Agente arquiteto | `starship.toml` Fuwarch prototipado (prompt kawaii com paletas Mocha/Latte) | `[TESTE PARCIAL]` — starship ausente na máquina de dev; config versionada, runtime pendente | prototypes/terminal/starship.toml |
| A-007 | 2026-11-06 | Rukafuu + Agente arquiteto | **P-005 (progresso):** M PLUS Rounded 1c instalada user-level (`~/.local/share/fonts/mplus-rounded/`, pesos Regular/Medium/Bold/ExtraBold via google/fonts) e aplicada como fonte da UI do Plasma | `fc-cache` + `fc-list` OK; `fc-match "Rounded Mplus 1c"` resolve; fonte UI ativa no `kdeglobals`. Empacotamento p/ ISO segue aberto | fontes na máquina de dev; doc 03 E-001 |
| A-008 | 2026-11-06 | Rukafuu + Agente arquiteto | Tema SDDM **"Fuwarch Kawaii" v0.1** clean-room (MIT): `Main.qml` em QtQuick 6 + `SddmComponents 2.0` (zero dependências KDE, NÃO deriva do breeze CC-BY-SA), `metadata.desktop` (Theme-API=2.0/QtVersion=6), `theme.conf` (accent/logo/background/font configuráveis) e README com gotchas. Visual: gradiente Mocha, bolhas translúcidas, sparkles animados, card de login arredondado raio 24, botões de energia | `sddm-greeter-qt6 --test-mode` rodou 12s completos sem NENHUM erro QML (exit 124 = kill do timeout do teste, não crash); log inspecionado com `QT_LOGGING_RULES` | prototypes/sddm/{fuwarch/*, README.md} |

<!-- Próximos registros: cada script, pacote, build de ISO ou tema que passar em teste ganha uma linha aqui. -->
