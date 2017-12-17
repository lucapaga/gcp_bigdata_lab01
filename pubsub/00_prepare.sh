#!/bin/bash
. ../00_set_params.sh

gcloud beta pubsub topics create chat-$V
gcloud beta pubsub subscriptions create chat-$V-subscription --topic chat-$V

echo "USE THE FOLLOWING SUBSCRIPTION NAME: 'chat-$V-subscription'"

echo "NOW HIT 'source ../src/python/mqtt_client/env/bin/activate' AT FIRST"
