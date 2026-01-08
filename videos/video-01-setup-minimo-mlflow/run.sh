#!/usr/bin/env bash
set -euo pipefail

if [[ ! -d ".venv" ]]; then
  python -m venv .venv
fi

# shellcheck source=/dev/null
source .venv/bin/activate

pip install --upgrade pip
pip install -r ../../requirements.txt

echo "Iniciando MLflow server en http://localhost:5000 (Ctrl+C para detener)..."
mlflow server --backend-store-uri sqlite:///mlflow.db --port 5000

