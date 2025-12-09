#!/bin/bash

PORT=8000

while true; do
    clear
    echo "⏳ Subindo servidor Python..."

    # Matar processo Python anterior (se existir)
    PY_PID=$(pgrep -f "python3 -m http.server $PORT")
    if [ ! -z "$PY_PID" ]; then
        kill -9 $PY_PID
    fi

    # Iniciar servidor
    python3 -m http.server $PORT >/dev/null 2>&1 &
    PYTHON_PID=$!
    sleep 1

    echo "🌐 Iniciando Cloudflared..."
    cloudflared tunnel --url http://localhost:$PORT >/dev/null 2>&1 &
    CF_PID=$!
    sleep 3

    echo "✅ Servidor online e monitorando quedas..."
    echo "🐍 Python PID: $PYTHON_PID"
    echo "☁️ Cloudflare PID: $CF_PID"
    echo ""

    # Loop de monitoramento
    while true; do
        sleep 3

        # Verifica se Python ainda está rodando
        if ! ps -p $PYTHON_PID >/dev/null; then
            echo "⚠️ Servidor Python caiu!"
            break
        fi

        # Verifica se Cloudflared está rodando
        if ! ps -p $CF_PID >/dev/null; then
            echo "⚠️ Cloudflared caiu!"
            break
        fi
    done

    echo "⛔ Algum serviço caiu! Reiniciando em 3 segundos..."
    sleep 3
done
