# Contribuir a la Guía de Videos — Lección 1: Introducción a Despliegue y MLOps

Este repositorio sigue la convención rígida de video por carpeta para que cada grabación sea reproducible sin depender de referencias externas. Antes de crear contenido nuevo o editar uno existente, lee con atención esta guía.

## Estructura obligatoria por video
1. Las carpetas deben llamarse `videos/video-XX-slug-en-minusculas` con número de dos dígitos.
2. Cada carpeta necesita, como mínimo: `README.md`, `video.json`, `guion.md`, un subdirectorio `code/` que incluya `README.md`, `run.sh`, `verify.sh`, `env.example` (si hay variables), `recording.md` y `assets/` con los recursos que se mostrarán en pantalla. Se recomienda agregar `docker/` cuando el video depende de un contenedor.
3. Los scripts `run.sh` y `verify.sh` deben ser ejecutables y seguir el flujo: preparar entorno, ejecutar la demo, imprimir `CHECKPOINT` con los mensajes que aparecen en el README.
4. `video.json` debe tener los campos `title`, `lecture_location`, `duration_estimate_min`, `priority`, `index`, `language`, `author` y `last_verified` (formato `YYYY-MM-DD`). Actualiza `last_verified` cada vez que modificas la carpeta y anota la fecha real del cambio.

## Cómo preparar un video
1. Crea la carpeta nueva o actualiza la existente bajo `videos/` siguiendo la plantilla de habitabilidad.
2. Actualiza los scripts `run.sh`, `verify.sh` y los archivos `code/` con el código / comandos que se enseñan en el video.
3. Documenta los checkpoints visibles dentro del README y asegúrate de que `verify.sh` imprima exactamente esos `CHECKPOINT` (misma redacción, incluyendo mayúsculas y prefijo).
4. Completa el `guion.md` con la estructura del video, tiempos sugeridos, comandos y notas de close-up. En `recording.md` describe resolución, fuentes y ventanas a mostrar.
5. Comprime la lógica en `run.sh` y `verify.sh`, pero evita que el video dependa de pasos manuales adicionales.

## Validación local y CI
- Usa `bash scripts/validate-videos.sh` para comprobar que cada carpeta `video-XX` tiene los archivos básicos. Este mismo script se ejecuta en `/.github/workflows/validate-videos.yml` durante cada push/PR que modifique `videos/`.
- Ejecuta `run.sh` y `verify.sh` desde el directorio del video antes de publicar: `cd videos/video-XX-slug && bash run.sh && bash verify.sh`.

## Naming, ramas y commits
| Concepto | Convención |
| --- | --- |
| Branch | `video/video-XX-descripcion` |
| Commits durante el desarrollo | `video: update video-XX - [breve descripción]` |
| Commit final de preparación | `video: ready video-XX - [título breve]` |

## Checklist mínimo antes de solicitar revisión
- [ ] La carpeta `videos/video-XX-slug` existe y contiene todos los archivos obligatorios.
- [ ] `video.json.last_verified` está actualizado con la fecha real de validación.
- [ ] `run.sh` prepara el entorno e imprime los comandos clave.
- [ ] `verify.sh` pasa localmente (exit code 0) y muestra los `CHECKPOINT` del README.
- [ ] Cada archivo de `code/` tiene su propio README y/o explicación.
- [ ] El guion documenta timings, comandos y close-ups.
- [ ] La documentación describe cómo lanzar el Docker (si aplica) y cómo generar datasets.
- [ ] La rama sigue el prefijo `video/` y el PR incluye reviewer pedagógico.

## Referencias
- `scripts/validate-videos.sh` verifica rápidamente la plantilla obligatoria.
- `recording_guide.md` contiene recomendaciones generales de producción.

