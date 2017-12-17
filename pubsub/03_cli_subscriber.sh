#!/bin/bash

. ../00_set_params.sh

gcloud beta pubsub subscriptions pull --auto-ack --max-messages=100 chat-$V-subscription
