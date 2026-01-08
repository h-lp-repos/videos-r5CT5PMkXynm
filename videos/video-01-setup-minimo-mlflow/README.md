# Setup mínimo de MLflow y arranque de la UI con SQLite

## Ubicación en la lecture
Tema 3 — *Setup mínimo de MLflow y tu primer experimento*, justo después del bloque de instalación y antes del mini-ejercicio práctico.

## Objetivo
Que el estudiante pueda crear el entorno virtual, instalar mlflow+scikit-learn+pandas, verificar la versión, arrancar el servidor tracking con backend SQLite y confirmar que `http://localhost:5000` muestra la pantalla inicial sin runs.

## Duración estimada
10 minutos (rango 9–11 min).

## Prioridad
Alta.

## Prerequisitos
- Python 3.10+ accesible como `python` o `python3`.
- Terminal básico (cd, activar venv, copiar/pegar comandos).
- Condiciones preferidas: Linux/macOS (mencionar equivalentes para PowerShell más abajo).

## Materiales y ambiente
- Terminal con fuente ≥16 px y modo oscuro clara, cursor visible.
- Navegador (Chrome o Firefox) listo para `http://localhost:5000`.
- Carpeta limpia (sin ruido visual) y `.venv` específico del video.
- Archivo `requirements.txt` (raíz) abierto para mostrar las versiones fijas.

## Setup rápido
1. `cd videos/video-01-setup-minimo-mlflow`.
2. `bash run.sh` (crea `.venv`, instala dependencias y levanta el server en el puerto 5000).
3. Abre `http://localhost:5000` en el navegador para mostrar la UI inicial.
4. Opcional: ejecuta `python code/status.py` para mostrar la URI de tracking y la lista de experimentos registrados.

## Pasos para ejecutar la demo
1. Ejecuta `bash run.sh` y deja el servidor en primer plano durante la grabación (Ctrl+C para detener).
2. Copia/pega `mlflow --version` en la terminal y comenta la versión 3.x.
3. Explica que `mlflow.db` se crea en la carpeta actual gracias al backend SQLite.
4. Abre `http://localhost:5000` y muestra la pantalla sin runs (resalta que la base de datos está vacía).
5. Ejecuta `python code/status.py` con el venv activo para subrayar la `MLFLOW_TRACKING_URI` y los experimentos disponibles.

## Checkpoints de verificación
- `CHECKPOINT 1: mlflow --version muestra una versión 3.x`
- `CHECKPOINT 2: mlflow.db existe en el directorio actual del video`
- `CHECKPOINT 3: http://localhost:5000 responde con 200 OK`

## Errores comunes y soluciones rápidas
- `command not found: mlflow` → activa `.venv/bin/activate` o `.venv\Scripts\activate` y vuelve a instalar.
- Puerto 5000 ocupado → menciona `mlflow server --port 5001` y abre `http://localhost:5001`.
- En Windows PowerShell no se activa con `source` → usar `.venv\Scripts\Activate.ps1`.

## Archivos incluidos
- `run.sh` (instala dependencias y arranca el tracking server).
- `verify.sh` (comprueba checkpoints con `mlflow --version`, `mlflow.db` y la UI).
- `video.json` y `guion.md` (metadatos y estructura del guion).
- `code/status.py` + `code/README.md` (muestra la URI y los experimentos).
- `assets/commands.txt` (comandos para mostrar en pantalla) y `recording.md` (instrucciones específicas de grabación).
- `env.example` (variables de entorno recomendadas) y `requirements.txt` compartido (root).

## Instrucciones de grabación
- Usa resolución 1920×1080 y 30 fps.
- Muestra la terminal y el navegador; mantén fuente ≥16 px.
- Destaca los comandos clave con resaltado de línea o cuadro en pantalla.
- Sigue la `recording.md` local para pausa, zoom y enfoque en la UI.

## Referencias
- [MLflow Installation & Quickstart](https://mlflow.org/docs/latest/install.html)
- [MLflow Tracking Server](https://mlflow.org/docs/latest/tracking.html)
- [MLflow CLI documentation](https://mlflow.org/docs/latest/cli.html)

