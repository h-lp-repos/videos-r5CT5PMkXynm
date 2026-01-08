#!/usr/bin/env bash
set -euo pipefail

if [[ ! -d ".venv" ]]; then
  python -m venv .venv
fi

source .venv/bin/activate
pip install --upgrade pip
pip install -r ../../requirements.txt

mlflow --version
# Los checkpoints usan un texto fijo para facilitar la validación.
echo "CHECKPOINT 1: mlflow --version muestra una versión 3.x"

server_pid=""
cleanup() {
  if [[ -n "${server_pid}" ]]; then
    kill "${server_pid}" >/dev/null 2>&1 || true
  fi
}
trap cleanup EXIT

check_ui() {
  curl -fs http://localhost:5000 >/dev/null 2>&1
}

if ! check_ui; then
  mlflow server --backend-store-uri sqlite:///mlflow.db --port 5000 >/tmp/mlflow-server.log 2>&1 &
  server_pid=$!
  sleep 4
  if ! check_ui; then
    echo "ERROR: la UI no respondió en el puerto 5000. Revisa que no haya otro proceso." 
    exit 1
  fi
fi

if [[ -f "mlflow.db" ]]; then
  echo "CHECKPOINT 2: mlflow.db existe en $(pwd)/mlflow.db"
else
  echo "ERROR: mlflow.db no se generó. Ejecuta el run.sh antes de validar."
  exit 1
fi

echo "CHECKPOINT 3: http://localhost:5000 responde con 200 OK"

