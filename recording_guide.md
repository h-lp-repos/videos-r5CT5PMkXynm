# Guía de grabación general

## Checklist técnico antes de grabar
- Micrófono con reducción de ruido activada y ganancia constante (evitar clipping).
- Cámara o captura de pantalla configurada a 1920×1080, 30 fps mínimo.
- Iluminación neutra y uniforme; evita reflejos en la pantalla y brillos sobre el teclado.
- Entorno limpio: apagado de notificaciones, fondo sin distracciones y ventanas relevantes en primer plano.
- Terminal, editor y navegador con fuente ≥ 16 px, modo oscuro (o contraste alto) y cursor/puntero resaltado.
- Ventanas a mostrar: terminal con el prompt, editor de código (cada video tiene su archivo principal), navegador con la UI de MLflow y/o una ventana con la grabación del script.
- Voz pausada, articulando comandos clave y dejando 0.5 s de pausa antes de mostrar resultados.

## Guion por secciones (aproximado)
1. **Video 1 — Setup y primer run (00:00–03:30)** – Explicar el objetivo de crear el entorno, activar el venv y revisar `mlflow --version`.
2. **Video 1 — UI mínima (03:30–06:30)** – Lanzar `mlflow server` sobre SQLite, abrir `http://localhost:5000` y mostrar la pantalla inicial.
3. **Video 2 — Tour UI (00:00–02:30)** – Analizar la lista de experimentos, elegir uno con nombre claro y explicar la tabla de runs.
4. **Video 2 — Detalle del best run (02:30–05:30)** – Ordenar por `accuracy`, entrar a un run y resaltar Overview, Metrics, Params y Artifacts.
5. **Video 3 — Código y logging (00:00–03:00)** – Mostrar `train.py`, enfocar las líneas de MLflow y explicar las llamadas a `log_param`, `log_metric`, `log_model`.
6. **Video 3 — Ejecución y nuevos runs (03:00–06:30)** – Ejecutar el script con dos conjuntos de hiperparámetros, revisar la terminal y la UI para mostrar los dos runs.
7. **Cierre (último minuto de cada video)** – Reforzar el checkpoint visible, mencionar el mini ejercicio y los recursos de `README.md`.

## Consejos de voz y ambiente
- Mantén un ritmo pausado, con frases cortas y énfasis en los comandos y checkpoints.
- Usa tonos ascendentes al introducir un comando nuevo y descendentes al leer resultados importantes.
- Pausa 1–2 segundos antes de mostrar la UI o los artefactos para que el espectador asimile el estado.
- Habla en español neutro, pero menciona los nombres técnicos en inglés (`experiments`, `runs`, `artifacts`).

## Finalizando cada video
- Muestra el checkpoint en la pantalla (por ejemplo, la tabla de runs ordenada o el logo de MLflow en la UI).
- Cierra con el mini ejercicio: solicita al alumno que repita el comando o identifique el mejor run.
- Recuerda mencionar el archivo `README.md` del video y dónde encontrar el `verify.sh` para confirmar los checkpoints.

