#!/bin/bash

. ../00_set_params.sh

if [ "$1" == "loop" ]
then
  while true; do
    gcloud beta pubsub subscriptions pull --auto-ack --limit 10 chat-$V-subscription
    sleep 2
  done
else
  gcloud beta pubsub subscriptions pull --auto-ack --limit 100 chat-$V-subscription
fi
