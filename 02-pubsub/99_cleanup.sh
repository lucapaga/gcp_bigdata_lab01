#!/bin/bash

. ../01-setup/00_set_params.sh

# CLEAN 'chat-$V-subscription' SUBSCRIPTION
gcloud beta pubsub subscriptions delete chat-$V-subscription
# CLEAN 'chat-$V' TOPIC
gcloud beta pubsub topics delete chat-$V

