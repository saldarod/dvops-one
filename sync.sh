#!/usr/bin/env bash
# Sincronizacao automatica do repositorio dvops-one entre notebook e desktop.
# Uso: ./sync.sh  (manual)  ou  agendado via Task Scheduler (sync-run.bat).
set -uo pipefail
cd "$(dirname "$0")" || exit 1

LOG=".sync.log"
STAMP="$(date '+%Y-%m-%d %H:%M:%S') [$(hostname)]"
echo "== $STAMP: iniciando ==" >> "$LOG"

# Garante identidade em maquina nova
[ -n "$(git config user.name)" ]  || git config user.name  "Rod Saldanha"
[ -n "$(git config user.email)" ] || git config user.email "rodsaldanha@gmail.com"

# 1) Commit do que mudou localmente
git add -A
if ! git diff --cached --quiet; then
  git commit -m "auto-sync: $STAMP" >> "$LOG" 2>&1
  echo "  -> mudancas locais commitadas" >> "$LOG"
fi

# 2) Traz remoto e reaplica local por cima
if ! git pull --rebase --autostash origin main >> "$LOG" 2>&1; then
  echo "  !! CONFLITO no pull. Abortando rebase para resolucao manual." >> "$LOG"
  git rebase --abort >> "$LOG" 2>&1
  echo "CONFLITO detectado: rode 'git status' e resolva manualmente."
  exit 1
fi

# 3) Envia
if ! git push origin main >> "$LOG" 2>&1; then
  echo "  !! Falha no push (rede/auth). Tentar novamente depois." >> "$LOG"
  exit 1
fi
echo "  -> concluido" >> "$LOG"
