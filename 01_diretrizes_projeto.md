# Fuwarch Linux — Documentação Oficial

## 01 — Diretrizes do Projeto

| Campo | Valor |
|---|---|
| Versão do documento | 0.2 |
| Data | 2026-11-06 |
| Status | Aprovado pelo mantenedor — Fase 0/1 em andamento |
| Mantenedor / OWNER | Rukafuu (https://github.com/Rukafuu) |
| Repositório de docs | github.com/Rukafuu/fuwarch-docs |
| Changelog | 0.1 escopo inicial · 0.2 resolve P-001 (licenças), P-002 (ícones), P-003 (stack do wizard) |

---

## 1. Visão e Escopo

**Fuwarch Linux** é uma distribuição Linux **baseada em Arch** voltada ao
público **otaku** (consumo de mídia japonesa e gaming), com estética "kawaii",
experiência polida out-of-the-box e filosofia de **rolling release puro**.

- **Base:** Arch Linux (espelhamento direto dos repositórios oficiais).
- **Filosofia:** máxima compatibilidade com Arch/AUR — sem reescrever o
  sistema, sem repositórios com delay (erro clássico estilo Manjaro).
  O diferencial está em **tematização, pré-configuração e ferramentas próprias**.
- **Nome:** fusão de "fuwafuwa" (ふわふわ, fofo) + Arch.
- **Arquitetura:** x86_64 exclusivo no MVP. ARM registrado como possibilidade
  futura, fora do escopo atual.

## 2. Público-Alvo

Persona principal do MVP (em ordem de prioridade):

1. **Consumidor de mídia** — assiste anime, lê mangá, usa Jellyfin/streaming
   legal, quer tudo funcionando sem configurar nada.
2. **Gamer** — joga Steam/Proton, Visual Novels e emuladores.

Persona para **Fase 2** (fora do MVP): criadores de conteúdo (desenho,
VTuber, edição de vídeo).

## 3. Identidade Visual

### 3.1 Mascote: Usami
- **Descrição:** assistente/mascote do projeto. Nekomimi com orelhas de
  coelho, mesclando estética japonesa com toques gregos e chineses.
- **Propriedade:** todos os direitos da personagem pertencem ao mantenedor
  (Rukafuu).
- **Licensing:** ver seção 7 — assets visuais sob CC BY-NC-ND 4.0.

### 3.2 Paleta e Tema
- **Padrão:** Dark "kawaii" baseado em **Catppuccin Mocha**, com acentos
  rosa (`#f5c2e7`) e mauve (`#cba6f7`).
- **Alternativa:** Catppuccin **Latte** (tema claro), com **switch rápido**
  entre os dois.
- Referência de paleta: https://github.com/catppuccin/catppuccin
- Protótipo vivo: `prototypes/kde/` neste repositório.

### 3.3 Elementos tematizados (MVP)
| Elemento | Decisão |
|---|---|
| Desktop principal | **KDE Plasma** (estabilidade) |
| Sessão alternativa | **Hyprland** (estética "rice") — mesma ISO |
| Boot splash | **Plymouth** com logo/silhueta da Usami, boot silencioso |
| Display manager | **SDDM** tematizado |
| Wallpapers | Pack Usami / anime |
| Terminal | **Starship** prompt pré-configurado |
| Fonte padrão | **M PLUS Rounded 1c** (+ Nerd Fonts para mono) |
| Ícones | **Tela Circle (variante pastel)** — decidido (D-008); conversa com as curvas da M PLUS Rounded e a estética kawaii |

### 3.4 Idioma
- **Inglês** como idioma base do ISO (alcance global).
- **Calamares traduzido**, oferecendo **PT-BR** de cara na primeira tela.

## 4. Recursos Core (MVP)

### 4.1 Consumo de mídia
- **mpv pré-configurado com Anime4K** (shaders ativados por padrão).
  *Diferencial-chave da distro.*
- Cliente **Jellyfin** (Flatpak) disponível por padrão / oferecido no wizard.

### 4.2 Trackers (MyAnimeList / AniList)
- Script **CLI leve** de sync MAL/AniList, a ser desenvolvido em **Go ou
  Python**. *Fase de desenvolvimento própria — não bloqueia o MVP.*
- Previsão: depois do primeiro ISO funcional.

### 4.3 Gaming
- **Multilib** habilitado de fábrica.
- Pré-instalados: **Steam**, **Lutris**, **ProtonUp-Qt**.
- **Visual Novels:** configurações de **locale japonês** prontas para uso no
  Lutris.

### 4.4 Língua japonesa
- Fontes **Noto CJK** inclusas no ISO.
- **fcitx5-mozc** (input japonês) **instalado, mas ativado somente via opção
  no wizard inicial**.

## 5. Experiência do Usuário (UX)

| Item | Decisão |
|---|---|
| Modelo de release | **Rolling puro** espelhando Arch |
| Segurança de update | **BTRFS + Snapper** com auto-snapshots e integração ao **GRUB** (boot em snapshot anterior) |
| Instalador | **Calamares** tematizado |
| Repositórios | Arch `core`/`extra` + **multilib** + **paru** pré-instalado + **Flathub** habilitado por padrão |
| Repo próprio | **fuwarch-core** (configs, temas, assets da Usami) com **prioridade máxima** no `pacman.conf` |
| Primeiro boot | **Wizard guiado pela Usami** em **Tauri** (frontend web reaproveitando componentes/CSS/animações da Usami do projeto usamiOS; backend Rust) — drivers NVIDIA, codecs, ativar mozc, pacotes otaku extras |
| Hardware alvo | Moderno — **8 GB RAM** recomendado |
| Filesystem | **BTRFS** padrão com subvolumes `@`, `@home`, `@log`, `@pkg` + **zRAM** ativado |

## 6. Diferenciais Técnicos

| Item | Decisão |
|---|---|
| Init | **systemd obrigatório** (compatibilidade total com Arch/Calamares) |
| Display server | **Wayland default**; X11 apenas como fallback por detecção de hardware antigo |
| Driver NVIDIA | Detecção no Calamares: **Turing ou mais nova → `nvidia-open`**; legado → **`nvidia-dkms`** |
| Kernel | **`linux-zen` padrão** (latência/gaming), `linux` vanilla como fallback |
| Tweaks de fábrica | **gamemode** e **zram** ativos por padrão |

## 7. Licenciamento (resolvido — P-001)

| Categoria | Licença | Motivação |
|---|---|---|
| **Assets visuais da Usami** (artes, wallpapers, logo, silhueta) | **CC BY-NC-ND 4.0** (Atribuição–Não Comercial–Sem Derivações) | Permite distribuição e espelhamento livres da ISO; impede venda de merchandising com a mascote e modificações/forks da imagem dela |
| **Código** do fuwarch-core (scripts, configs, pacotes) | **MIT** (padrão); **GPLv3** obrigatório em código derivado de código GPL | Compatibilidade máxima com a comunidade Linux e com pacotes Arch |

- Assets do tema de terceiros (Catppuccin, Tela Circle, M PLUS Rounded,
  Nerd Fonts) mantêm suas licenças originais (todas compatíveis com
  distribuição livre).
- Texto legal completo das assets será incluído em `fuwarch-core/assets/LICENSE`
  quando o repo existir (ver P-004).

## 8. Registro de Decisões (ADRs resumidos)

| ID | Decisão | Justificativa |
|---|---|---|
| D-001 | KDE Plasma principal + Hyprland alternativo na mesma ISO | Estabilidade + estética rice sem dividir projeto em 2 ISOs |
| D-002 | Rolling puro + Snapper/BTRFS em vez de repo com delay | Compatibilidade total com Arch/AUR; rollback resolve quebras |
| D-003 | Catppuccin Mocha/Latte como base da paleta | Maduro, consistente entre apps GTK/Qt/Terminal |
| D-004 | Sem ferramentas de pirataria nos repos oficiais | Protege mirrors, hospedagem e reputação |
| D-005 | mpv + Anime4K por padrão | Diferencial-chave para o público de anime |
| D-006 | fcitx5-mozc instalado mas inativo por padrão | Evita conflito de IME para não-usuários; ativação no wizard |
| D-007 | linux-zen como kernel padrão | Latência para gaming/desktop |
| D-008 | Ícones: **Tela Circle (pastel)** | Formato circular combina com M PLUS Rounded e estética kawaii; cara de "rice" premium no primeiro boot |
| D-009 | Wizard em **Tauri** | Reaproveita componentes web/CSS/animações da Usami (usamiOS); GTK4/Adwaita luta para respeitar fielmente cantos arredondados e paleta Mocha |
| D-010 | Assets da Usami sob **CC BY-NC-ND 4.0** | Protege IP da mascote contra uso comercial e derivações; mantém ISO livre para distribuir/espelhar |
| D-011 | Código do fuwarch-core sob **MIT** (GPLv3 onde derivado de GPL) | Compatibilidade com comunidade Linux |

## 9. Pendências

| ID | Pendência | Status | Impacto |
|---|---|---|---|
| P-001 | Licença explícita das assets da Usami | ✅ **Resolvida (2026-11-06)** — CC BY-NC-ND 4.0 (D-010) | — |
| P-002 | Escolha do tema de ícones | ✅ **Resolvida (2026-11-06)** — Tela Circle pastel (D-008) | — |
| P-003 | Stack do wizard | ✅ **Resolvida (2026-11-06)** — Tauri (D-009) | — |
| P-004 | Infra do repo fuwarch-core (hosting do pacman repo + chaves de assinatura) | 🔴 Aberta | Bloqueia empacotamento próprio |
| P-005 | Empacotamento da fonte **M PLUS Rounded 1c** no fuwarch-core/ISO (não presente na máquina de dev) | 🔴 Aberta | Bloqueia look-and-feel final |

## 10. Roadmap (fases)

- **Fase 0 — Fundação (em andamento):** documentação v0.2 publicada em repo
  público; protótipo de tematização KDE em `prototypes/kde/`.
- **Fase 1 — MVP ISO:** build com archiso/Calamares tematizado, BTRFS+Snapper,
  Plymouth, SDDM, pacotes core.
- **Fase 2 — Wizard da Usami (Tauri) + fuwarch-core repo.**
- **Fase 3 — Ferramenta de sync MAL/AniList, polimento Hyprland rice.**
- **Fase 4 — Público criador de conteúdo (Krita, OBS, etc.).**
