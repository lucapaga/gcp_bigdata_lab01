#!/bin/bash

. ../01-setup/00_set_params.sh

# STREAM-PULL '$topic-sub-cli' SUBSCRIPTION SLEEPING 1s FOR EACH LOOP
# (https://cloud.google.com/sdk/gcloud/reference/beta/pubsub/subscriptions/pull)
while true; do
	gcloud beta pubsub subscriptions pull $topic-sub-cli --limit=10 --max-messages=10 --auto-ack
	sleep 1
done
