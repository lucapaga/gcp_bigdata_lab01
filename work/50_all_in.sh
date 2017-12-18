#!/bin/bash

. 00_set_params.sh

./01_do_login.sh
./03_pubsub_create_topic.sh
./05_iotcore_create_registry.sh
./07_iotcore_create_device.sh
./08_bigquery_create_table.sh
./09_dataflow_start_pipeline.sh

source ../src/python/mqtt_client/env/bin/activate

./16_device_client_run_multiple.sh europa.txt
./16_device_client_run_multiple.sh oriente.txt
./16_device_client_run_multiple.sh oceania.txt
./16_device_client_run_multiple.sh na.txt

echo "THAT'S ALL"
