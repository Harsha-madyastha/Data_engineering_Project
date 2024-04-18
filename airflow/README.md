# Airflow Setup and Execution Guide

## Setup
Follow this [link](https://github.com/DataTalksClub/data-engineering-zoomcamp/blob/main/cohorts/2022/week_2_data_ingestion/airflow/1_setup_official.md) for step-by-step Airflow setup.

## Execution

Build the image (only first-time, or when there's any change in the Dockerfile, takes ~15 mins for the first-time):

```shell
docker-compose build
```

Initialize the Airflow scheduler, DB, and other config:

```shell
docker-compose up airflow-init
```

Kick up all the services from the container:
```shell
docker-compose up
```

In another terminal, run docker-compose ps to see which containers are up & running (there should be 7, matching with the services in your docker-compose file).

Login to Airflow web UI on localhost:8080 with default creds: airflow/airflow.

Run your DAG on the Web Console.

On finishing your run or to shut down the container/s:

```shell
docker-compose down
```

To stop and delete containers, delete volumes with database data, and download images, run:

```shell
docker-compose down --volumes --rmi all
```

or
```shell
docker-compose down --volumes --remove-orphans
```

Please follow this [link](https://github.com/DataTalksClub/data-engineering-zoomcamp/tree/main/cohorts/2022/week_2_data_ingestion/airflow) if you come across any trouble relating to setup or execution.
