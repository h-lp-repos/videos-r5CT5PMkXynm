# Guía de Videos — Lección 1: Introducción a Despliegue y MLOps

Este repositorio reúne todos los artefactos necesarios para que el equipo pedagógico y el equipo de grabación produzcan los tres videos prácticos de la Lección 1: desde el setup mínimo de MLflow hasta la generación de runs y la navegación por la UI.

## Propósito
Cada carpeta bajo `videos/` contiene la estructura completa para grabar un video: código, comandos visibles, guion, scripts reproducibles y verificaciones automáticas. El objetivo es que un grabador pueda clonar el repo, ejecutar los scripts y grabar la pantalla sin investigar nada adicional.

## Videos disponibles
- [video-01-setup-minimo-mlflow](videos/video-01-setup-minimo-mlflow) — Setup del entorno virtual, instalación de dependencias mínimas y arranque de la UI de MLflow sobre SQLite.
- [video-02-tour-ui-mlflow](videos/video-02-tour-ui-mlflow) — Tour guiado por la UI del Tracking Server con filtros, ordenación por métricas y best run claramente identificado.
- [video-03-logging-mlflow-con-sklearn](videos/video-03-logging-mlflow-con-sklearn) — Script inspirado en RandomForest + Iris que registra parámetros, métricas y modelos y genera dos runs distintos.

## Preparación del entorno antes de grabar
1. Clona el repositorio y crea el entorno virtual en la raíz: `python3 -m venv .venv` (o `python -m venv .venv`).
2. Activa el entorno (`source .venv/bin/activate` en macOS/Linux o `.venv\Scripts\activate` en PowerShell).
3. Actualiza pip e instala dependencias: `pip install --upgrade pip` y luego `pip install -r requirements.txt`.
4. Copia `env.example` a `.env` si deseas personalizar `MLFLOW_TRACKING_URI` o `MLFLOW_EXPERIMENT_NAME` antes de ejecutar cualquier script.
5. Sigue los `run.sh` y `verify.sh` que están dentro de cada carpeta de video para preparar la demo y confirmar los checkpoints visibles.

## Validación local
Ejecuta `bash scripts/validate-videos.sh` desde la raíz. Este script revisa que cada carpeta `videos/video-XX-*` contenga los archivos obligatorios (README, guion, JSON, run/verify scripts y `code/README.md`). El mismo script corre en el CI (`.github/workflows/validate-videos.yml`).

## Integración continua
La acción de GitHub Actions ubicada en `.github/workflows/validate-videos.yml` se dispara en pushes o pull requests que afectan `videos/`. La acción ejecuta `bash scripts/validate-videos.sh` y falla si falta alguno de los archivos esenciales.

## Recursos complementarios
- [`recording_guide.md`](recording_guide.md): checklist general de grabación, resolución, ritmo y checklist técnico.
- [`assets/`](assets/): comandos listos para mostrar en pantalla y recordatorios de slides.
- [`examples/demo.ipynb`](examples/demo.ipynb): notebook que ejemplifica la inferencia con un modelo guardado.
- [`slides_template.md`](slides_template.md): estructura sugerida para las diapositivas del módulo.

## Políticas para artefactos grandes
Evita subir datasets pesados o binarios (`.mp4`, `.zip`, etc.). Si necesitas datos, crea un `download_data.sh` y un checksum asociado y explícalo en el README del video correspondiente. Usa `.gitattributes`/Git LFS solo si no queda más opción.

## Contribuir
Sigue las convenciones descritas en [`CONTRIBUTING.md`](CONTRIBUTING.md): usa ramas `video/video-XX-descripción`, actualiza `video.json.last_verified` con la fecha real (`YYYY-MM-DD`), documenta los checkpoints en el README y haz commits frecuentes con prefijos `video:`.

