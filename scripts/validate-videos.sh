#!/usr/bin/env bash
set -euo pipefail

REQUIRED_FILES=("README.md" "video.json" "guion.md" "run.sh" "verify.sh")
REQUIRED_DIRS=("code")
REQUIRED_CODE_FILES=("code/README.md")

missing=0

for dir in videos/video-*; do
  if [[ ! -d "$dir" ]]; then
    continue
  fi

  echo "Validando carpeta: $dir"

  for file in "${REQUIRED_FILES[@]}"; do
    if [[ ! -f "$dir/$file" ]]; then
      echo "  ❌ Falta $file en $dir"
      missing=1
    fi
  done

  for subdir in "${REQUIRED_DIRS[@]}"; do
    if [[ ! -d "$dir/$subdir" ]]; then
      echo "  ❌ Falta carpeta $subdir en $dir"
      missing=1
    fi
  done

  for subfile in "${REQUIRED_CODE_FILES[@]}"; do
    if [[ ! -f "$dir/$subfile" ]]; then
      echo "  ❌ Falta $subfile en $dir"
      missing=1
    fi
  done

done

if [[ $missing -ne 0 ]]; then
  echo "Validación fallida: corrige los errores anteriores y vuelve a ejecutar este script."
  exit 1
fi

for dir in videos/video-*; do
  if [[ -d "$dir" ]]; then
    echo "✅ $dir tiene todos los archivos obligatorios."
  fi
done

