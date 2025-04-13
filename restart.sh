#!/bin/bash

# Redémarre proprement la stack infra-ai

ROOT_DIR="infra-ai"

if [ ! -d "$ROOT_DIR" ]; then
  echo "❌ Le répertoire $ROOT_DIR n'existe pas."
  exit 1
fi

cd "$ROOT_DIR"
echo "♻️ Redémarrage des services Docker..."
docker compose down && docker compose up -d

echo "✅ Services redémarrés avec succès."
