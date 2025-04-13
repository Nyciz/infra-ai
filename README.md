# 🧠 infra-ai — Stack IA locale avec Docker + Traefik

Cette stack regroupe plusieurs services IA auto-hébergés accessibles via un reverse proxy sécurisé (Traefik + HTTPS) avec contrôle IP :

- **Ollama** : LLM local (LLaMA, Mistral, etc.)
- **ChromaDB** : Base vectorielle persistante
- **Whisper** : Transcription audio (speech-to-text)
- **Piper** : Synthèse vocale (text-to-speech)
- **Traefik** : Reverse proxy avec Let's Encrypt + IP Whitelist

...

## 📦 Lancement rapide

```bash
chmod +x setup.sh
./setup.sh
```

...
