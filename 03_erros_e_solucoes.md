# 03 — Erros e Soluções

> Regra: TUDO que quebrar (bug, dependência, kernel panic, build failure)
> é registrado aqui. Agentes futuros DEVEM consultar este arquivo antes de
> repetir qualquer abordagem que falhou.

## Formato

| ID | Data | Componente | Sintoma | Causa raiz | Solução exata | Status |
|---|---|---|---|---|---|---|

### Exemplo de preenchimento (modelo — não é erro real)

| E-001 | 2026-11-06 | calamares | Módulo partition falha no chroot | fstab gerado sem subvol btrfs | Adicionar `subvol=@` em options + rebuild ISO | Exemplo |

## Lições arquivadas
(nenhuma ainda)
