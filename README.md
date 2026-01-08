# Guía de Videos — Lección 1: Introducción a Despliegue y MLOps

Este repositorio reúne todo lo necesario para producir los tres videos prácticos de la Lección 1: desde el setup mínimo con MLflow, pasando por el logging de hiperparámetros con scikit-learn y terminando en un tour guiado por la UI del tracking server. Cada carpeta bajo `videos/` contiene los artefactos listos para grabar: código, scripts, guion y verificaciones.

## Videos disponibles
- [video-01-setup-minimo-mlflow](videos/video-01-setup-minimo-mlflow): Arranque del entorno virtual, instalación de dependencias, verificación de `mlflow --version`, generación del archivo `mlflow.db` y primera conexión a la UI basada en SQLite.
- [video-02-tour-ui-mlflow](videos/video-02-tour-ui-mlflow): Navegación guiada por la UI del Tracking Server con filtros, ordenación por métricas y observación de parámetros, métricas y artefactos en 3–4 runs reales.
- [video-03-logging-mlflow-con-sklearn](videos/video-03-logging-mlflow-con-sklearn): Script de entrenamiento (RandomForest + Iris) que usa la API de MLflow para registrar parámetros, métricas y modelos, generando al menos dos runs distintos.

## Preparación del entorno
1. Clona el repositorio y crea un entorno virtual en la raíz: `python3 -m venv .venv` (o `python -m venv .venv`).
2. Activa el entorno: `source .venv/bin/activate` en macOS/Linux o `.venv\Scripts\activate` en Windows PowerShell.
3. Actualiza pip e instala las dependencias mínimas: `pip install --upgrade pip` seguido de `pip install -r requirements.txt`.
4. Copia `env.example` a `.env` si quieres personalizar los valores de `MLFLOW_TRACKING_URI`, `MLFLOW_EXPERIMENT_NAME` u otros antes de ejecutar cualquier script.
5. Para trabajar con cada video sigue sus `run.sh` (por ejemplo `bash videos/video-01-setup-minimo-mlflow/run.sh`) y luego ejecuta su `verify.sh` para confirmar los checkpoints visibles.

## Validación local
Ejecuta `bash scripts/validate-videos.sh` desde la raíz. El script comprueba que cada carpeta `videos/video-XX-*` tiene los archivos obligatorios (README.md, video.json, guion.md, code/ con su README, run.sh y verify.sh) antes de hacer un commit o push.

## Flujo de producción recomendado
1. Sigue la `CONTRIBUTING.md` para crear una rama `video/video-XX-[acción]` y mantener la convención de nombres.
2. Llena todos los archivos obligatorios en la carpeta correspondiente, actualiza `video.json.last_verified` con la fecha del día (por ejemplo `2026-01-08`) y documenta en el README los checkpoints y la grabación.
3. Ejecuta el `run.sh` del video, luego el `verify.sh`, y comprueba localmente que las salidas contienen las líneas de checkpoint mencionadas en el README.
4. Haz commits frecuentes por video, con prefijo `video: update video-XX` durante el desarrollo y un último commit `video: ready video-XX - [título breve]` cuando el contenido esté listo.
5. Abre un pull request contra `main`, asigna a un reviewer pedagógico y adjunta la checklist completada.

## Recursos complementarios incluidos
- `recording_guide.md`: guía general de grabación (resolución, ritmo, checklist técnico).
- `slides_template.md`: estructura sugerida para la presentación (portada, pasos, referencias).
- `assets/`: textos de apoyo para guion y comandos listos para mostrar en cada video.
- `examples/demo.ipynb`: notebook ligero de inferencia que muestra cómo cargar un modelo guardado con joblib.
- `docker/` (si aplica en cada video): imágenes o instrucciones para levantar el stack completo.

## Validación en CI
El workflow `/.github/workflows/validate-videos.yml` ejecuta `bash scripts/validate-videos.sh` en cada push o PR que afecte `videos/`. Garantiza que no falte ningún archivo clave en las carpetas que empiezan con `video-`.

## Políticas de artefactos grandes
Evita subir datasets binarios pesados. Si necesitas datos, crea un script `download_data.sh` con enlaces a fuentes oficiales y un checksum. Usa `.gitattributes`/Git LFS solo para archivos que no puedan comprimirse.

