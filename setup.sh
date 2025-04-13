#!/bin/bash

set -e

# Script de configuration initiale pour infra-ai
# Crée les répertoires et lance les services à partir de infra-ai/

ROOT_DIR="infra-ai"

echo "🔧 Vérification de Docker..."
docker --version || { echo "Docker n'est pas installé."; exit 1; }
docker compose version || { echo "Docker Compose n'est pas installé."; exit 1; }

if [ ! -d "$ROOT_DIR" ]; then
  echo "📁 Création du dossier $ROOT_DIR"
  mkdir -p "$ROOT_DIR"
fi

cd "$ROOT_DIR"

echo "📁 Création des sous-répertoires..."
mkdir -p traefik/letsencrypt
mkdir -p data/ollama data/chroma data/whisper/models data/piper

echo "✅ Téléchargement modèle Piper (fr_FR-upmc-medium.onnx recommandé) :"
echo "👉 https://huggingface.co/rhasspy/piper-voices/tree/main/fr"
echo "Placez le fichier dans: $ROOT_DIR/data/piper/"

echo "✅ Téléchargement modèle Whisper (ggml-medium.bin recommandé) :"
echo "👉 https://huggingface.co/ggerganov/whisper.cpp"
echo "Placez le fichier dans: $ROOT_DIR/data/whisper/models/"

echo "🚀 Lancement des services Docker..."
docker compose up -d

echo "✅ Tout est lancé. Accès possible :"
echo "- https://<ip>/ollama"
echo "- https://<ip>/chroma"
echo "- https://<ip>/piper"
echo "- https://<ip>:5002/api/tts (Piper brut)"
echo "- http://<ip>/whisper (si tu exposes Whisper)"
echo "👮 Accès restreint au LAN + IP 93.23.70.226 via Traefik"

echo "📦 Bon travail !"
