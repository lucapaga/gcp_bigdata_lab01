#!/bin/bash

. ../01-setup/00_set_params.sh

# STREAM-PULL 'chat-$V-subscription' SUBSCRIPTION SLEEPING 2s FOR EACH LOOP
# (https://cloud.google.com/sdk/gcloud/reference/beta/pubsub/subscriptions/pull)
while true; do
	gcloud beta pubsub subscriptions pull chat-$V-subscription --limit=10 --max-messages=10 --auto-ack
	sleep 1
done
