# Guion del video

## 00:00–00:30 — Introducción
- Presentar la Lección 1 y el flujo general: setup, logging y UI.
- Explicar que este primer video muestra cómo preparar el entorno y arrancar la UI para tener una base reproducible.
- Mencionar la prioridad alta: es prerequisito para los demás videos.

## 00:30–02:30 — Crear y activar el entorno virtual
- Mostrar `python -m venv .venv` y comentar que se crea una carpeta específica dentro de la carpeta del video.
- Comentar la diferencia entre macOS/Linux (`source .venv/bin/activate`) y Windows PowerShell (`.venv\Scripts\Activate.ps1`).
- Hacer zoom en el prompt para que se vea el nombre del entorno.

## 02:30–04:30 — Instalar dependencias y verificar MLflow
- Ejecutar `pip install --upgrade pip` seguido de `pip install -r ../../requirements.txt`.
- Resaltar que el `requirements.txt` fija `mlflow>=3.1`, `scikit-learn`, `pandas` y `joblib`.
- Ejecutar `mlflow --version` y decir que la salida debe comenzar con `mlflow, version 3.`.

## 04:30–06:30 — Arrancar el tracking server
- Correr `mlflow server --backend-store-uri sqlite:///mlflow.db --port 5000` (desde `run.sh` o directamente).
- Abrir `http://localhost:5000` y mostrar la pantalla inicial (experimentos vacíos).
- Comentar que se creó `mlflow.db` y que el backend SQLite se guarda junto al server.

## 06:30–08:30 — Mostrar estado con el script adicional
- Ejecutar `python code/status.py` para mostrar `mlflow.get_tracking_uri()` y la cantidad de experimentos registrados.
- Resaltar la importancia de conocer el tracking URI para evitar confusiones.

## 08:30–10:00 — Cierre y transición
- Reforzar los checkpoints: versión, `mlflow.db` y UI.
- Recordar el mini ejercicio: ejecutar los comandos y verificar la existencia de `mlflow.db`.
- Mencionar que el siguiente video muestra un tour de la UI con runs reales.

## Comandos clave (mostrar en pantalla)
1. `python -m venv .venv`
2. `source .venv/bin/activate` o `.venv\Scripts\Activate.ps1`
3. `pip install -r ../../requirements.txt`
4. `mlflow --version`
5. `mlflow server --backend-store-uri sqlite:///mlflow.db --port 5000`
6. `python code/status.py`

## Indicaciones de cámara/zoom
- Zoom en la línea de comandos al activarse el venv.
- Close-up al mostrar `mlflow --version` y la creación de `mlflow.db` en el explorador de archivos.
- Enfocar la barra del navegador al abrir la UI.

