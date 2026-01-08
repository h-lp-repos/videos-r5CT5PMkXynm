# Guía de Videos — Lección 1: Introducción a Despliegue y MLOps

Este repositorio agrupa todo lo necesario para grabar los tres videos prácticos de la Lección 1: desde el setup mínimo de MLflow, pasando por el logging de parámetros y modelos con scikit-learn, hasta el tour por la UI de tracking.

## Videos disponibles
- [video-01-setup-minimo-mlflow](videos/video-01-setup-minimo-mlflow): Arranque del entorno (venv, mlflow server, sqlite) y comprobación de la UI.
- [video-02-tour-ui-mlflow](videos/video-02-tour-ui-mlflow): Navegación guiada por la UI con filtros, métricas y runs pre-generados.
- [video-03-logging-mlflow-con-sklearn](videos/video-03-logging-mlflow-con-sklearn): Script de entrenamiento para loggear parámetros, métricas y modelos.

## Validación local
Ejecuta `bash scripts/validate-videos.sh` desde la raíz para verificar que cada carpeta `videos/video-XX-*` contiene los archivos obligatorios (README.md, video.json, guion.md, code/, run.sh y verify.sh). El mismo script se usa en el workflow `ci/validate-videos.yml`.

## Flujo de preparación
1. Clonar el repo y montar un entorno Python 3.10+ (`python -m venv .venv`).
2. Activar el entorno e instalar las dependencias con `pip install -r requirements.txt`.
3. Correr los scripts `run.sh` de cada video, luego ejecutar `verify.sh` para confirmar los checkpoints.
4. Subir los cambios en una rama `video/video-XX-*` y abrir PR con el checklist completado.

## Contribuir
Consulta [CONTRIBUTING.md](CONTRIBUTING.md) para entender cómo agregar nuevos videos, nombres de carpetas, metadatos y pruebas automáticas.

## Validación en CI
El workflow `/.github/workflows/validate-videos.yml` ejecuta `bash scripts/validate-videos.sh` en cada push o PR que afecte `videos/`. Asegura que las carpetas con prefijo `video-` sigan la plantilla obligatoria y falte ningún archivo crítico.

## Políticas de artefactos grandes
Evita subir datasets binarios pesados en el repo. Si necesitas datos, incluye un script `download_data.sh` con un checksum o referencia a almacenamiento externo aprobado. Usa `.gitattributes` + Git LFS solo cuando el archivo no pueda comprimirse.

