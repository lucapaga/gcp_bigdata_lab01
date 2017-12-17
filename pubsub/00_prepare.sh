#!/bin/bash
. ../00_set_params.sh

gcloud beta pubsub topics create chat-$V
gcloud beta pubsub subscriptions create chat-$V-subscription --topic chat-$V

echo ""
echo "----------------------------------"
echo "         TOPIC: 'chat-$V'"
echo "  SUBSCRIPTION: 'chat-$V-subscription'"
echo "----------------------------------"
echo ""
