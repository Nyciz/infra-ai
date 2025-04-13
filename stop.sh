#!/bin/bash

# Arrête proprement la stack infra-ai

ROOT_DIR="infra-ai"

if [ ! -d "$ROOT_DIR" ]; then
  echo "❌ Le répertoire $ROOT_DIR n'existe pas."
  exit 1
fi

cd "$ROOT_DIR"
echo "🛑 Arrêt des services Docker..."
docker compose down

echo "✅ Tous les services ont été arrêtés."
