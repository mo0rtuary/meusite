#!/data/data/com.termux/files/usr/bin/bash

echo "🔍 Encerrando servidores antigos..."
pkill -f http.server > /dev/null 2>&1

sleep 1

echo "🚀 Iniciando novo servidor Python..."
python3 -m http.server 8000 > /dev/null 2>&1 &

sleep 2

# Testa se o servidor abriu mesmo
if curl -s http://localhost:8000 > /dev/null; then
    echo "✅ Servidor ativo em localhost:8000"
else
    echo "❌ ERRO: Servidor NÃO iniciou! Algo está usando a porta."
    exit 1
fi

sleep 1

echo "🌐 Iniciando Cloudflared..."
cloudflared tunnel --url http://localhost:8000
