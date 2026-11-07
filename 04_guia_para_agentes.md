# 04 — Guia para Agentes (Handoff)

> LEIA PRIMEIRO. Este arquivo resume o estado atual para qualquer IA/agente
> que assumir o projeto. Atualize-o AO FIM de cada sessão de trabalho.

## Missão
Fuwarch Linux — distro baseada em Arch para o público otaku.
Escopo e decisões: ver `01_diretrizes_projeto.md` (fonte da verdade).

## Estado atual (2026-11-06)
- **Fase:** 0 — Fundação. Documentação v0.2 aprovada e publicada em repo
  público (`Rukafuu/fuwarch-docs`).
- Nenhuma build de ISO ainda. Nenhum erro registrado (doc 03 vazio).
- Pendências abertas: **P-004** (infra fuwarch-core), **P-005** (empacotar
  fonte M PLUS Rounded).
- Próximo passo definido: **protótipo de tematização KDE Plasma** em
  `prototypes/kde/` (esquema de cores Catppuccin Mocha kawaii + Konsole),
  testável na máquina de dev (Nyarch Linux, Plasma 6.7.4, Wayland, SDDM).

## Ambiente de desenvolvimento (máquina do mantenedor)
- SO base: Nyarch Linux (Arch-based, pacman)
- Desktop: KDE Plasma 6.7.4 · Wayland · SDDM 0.21
- Tema atual antes do protótipo: **BreezeDark** (alvo de rollback)
- `gh` autenticado como Rukafuu (escopo repo); git identity: Rukafuu <ruka@usami.dev>

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
