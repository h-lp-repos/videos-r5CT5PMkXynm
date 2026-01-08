#!/usr/bin/env python3
"""Muestra el estado del tracking server conectado al directorio del video."""

from mlflow.tracking import MlflowClient
import mlflow


def main() -> None:
    client = MlflowClient()
    print("Tracking URI:", mlflow.get_tracking_uri())
    print(f"Experimentos registrados ({len(client.list_experiments())}):")
    for experiment in client.list_experiments():
        print(f"- {experiment.name} (id {experiment.experiment_id}, estado {experiment.lifecycle_stage})")


if __name__ == "__main__":
    main()

