#!/bin/bash
. ../00_set_params.sh

gcloud beta pubsub subscriptions delete chat-$V-subscription
gcloud beta pubsub topics delete chat-$V
