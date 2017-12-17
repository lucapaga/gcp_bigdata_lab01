#!/bin/bash

. ../00_set_params.sh

gcloud beta pubsub subscriptions pull --auto-ack chat-$V-subscription
