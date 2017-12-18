#!/bin/bash

. 00_set_params.sh

./96_dataflow_stop_pipeline.sh
./94_pubsub_topic_delete.sh
./98_iotcore_delete_device.sh
./93_iotcore_registry_delete.sh
./95_bigquery_delete_table.sh

echo "THAT'S ALL"
