# 04 — Guia para Agentes (Handoff)

> LEIA PRIMEIRO. Este arquivo resume o estado atual para qualquer IA/agente
> que assumir o projeto. Atualize-o AO FIM de cada sessão de trabalho.

## Missão
Fuwarch Linux — distro baseada em Arch para o público otaku.
Escopo e decisões: ver `01_diretrizes_projeto.md` (fonte da verdade).

## Estado atual (2026-11-06)
- **Fase:** 0 — Fundação concluída; prototipagem visual avançada.
- Documentação v0.2 aprovada e publicada em repo público
  (`Rukafuu/fuwarch-docs`).
- **Protótipo SDDM validado** (`prototypes/sddm/fuwarch/`): v0.2 com
  greeter de usuário (avatar Usami circular, nome do userModel, senha +
  seta) e seletor multi-usuário (dropdown puro — **nunca QQC2.Popup**, ver
  doc 03 E-002). Render verificado por screenshot; `preview.png` incluído.
  Instalação real (sudo) pendente.
- **Protótipo KDE aplicado e validado** na máquina de dev:
  - Tema escuro "Fuwarch Kawaii Mocha" **ativo** na sessão Plasma 6.7.4/Wayland.
  - Tema claro "FuwarchKawaiiLatte" criado; **switch dark/light validado**.
  - Konsole com perfil `Fuwarch` como **padrão** (rollback: `Profile 1.profile`).
  - Fonte **Rounded Mplus 1c** instalada (user-level) e **ativa na UI**
    (P-005 parcialmente resolvida — falta empacotamento p/ ISO).
  - `starship.toml` versionado mas NÃO testado em runtime (starship ausente).
- Rollback geral documentado em `prototypes/kde/README.md`.
- Erros registrados: **E-001** (naming da fonte — ler doc 03 antes de tocar
  em qualquer config de fonte).
- Pendências abertas: **P-004** (infra fuwarch-core), **P-005** (empacotar
  fonte p/ ISO — instalada só na máquina de dev).
- Próximos passos sugeridos (protótipo → Fase 1): instalar/testar starship,
  tema SDDM, look-and-feel completo (wallpaper/cursor/pack), tema de ícones
  Tela Circle pastel, e depois o build archiso + Calamares.

## Ambiente de desenvolvimento (máquina do mantenedor)
- SO base: Nyarch Linux (Arch-based, pacman)
- Desktop: KDE Plasma 6.7.4 · Wayland · SDDM 0.21
- Rollback geral: tema `BreezeDark`; fonte UI padrão `Noto Sans,10,-1,5,400,0,0,0,0,0`;
  perfil Konsole `Profile 1.profile` (valores anteriores ao protótipo)
- Fontes: `~/.local/share/fonts/mplus-rounded/` (user-level, 4 pesos)
- `gh` autenticado como Rukafuu (escopo repo); git identity: Rukafuu <ruka@usami.dev>
- Sem sudo sem senha nesta máquina — ações de sistema exigem o mantenedor

## Regras do projeto
1. NUNCA contrariar decisões do doc 01 — proponha alteração como novo ADR.
2. Todo passo testado com sucesso entra no `02_passos_executados.md`.
3. Todo erro entra no `03_erros_e_solucoes.md` com solução exata.
4. Postura legal estrita: nada de ferramentas de pirataria nos repos (D-004).
5. Máxima compatibilidade com Arch/AUR (D-002) — sem forks de pacotes base.
6. Assets da Usami são CC BY-NC-ND 4.0 (D-010): nunca permitir uso comercial
   ou derivações delas em docs/código.

## Protocolo de handoff
1. Ler `01` (decisões), `02` (o que já funciona), `03` (o que NÃO repetir).
2. Atualizar `02` a cada ação concluída e `04` no fim da sessão.
3. Registrar data e identificação do agente responsável em cada entrada.

## Agentes que trabalharam no projeto
| Data | Agente | Sessão |
|---|---|---|
| 2026-11-06 | Arquiteto inicial (opencode/GLM) | Fundação, docs v0.1→v0.2, protótipo KDE |
