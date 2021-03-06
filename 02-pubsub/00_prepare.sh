#!/bin/bash
. ../01-setup/00_set_params.sh

# CREATE TOPIC NAMED 'chat-$V' WITH CLI
# (https://cloud.google.com/sdk/gcloud/reference/beta/pubsub/topics/create)
gcloud beta pubsub topics create chat-$V

# CREATE SUBSCRIPTION NAMED 'chat-$V-subscription' FOR TOPIC 'chat-$V' WITH CLI
# (https://cloud.google.com/sdk/gcloud/reference/beta/pubsub/subscriptions/create)
gcloud beta pubsub subscriptions create chat-$V-subscription --topic=chat-$V

echo ""
echo "----------------------------------"
echo "         TOPIC: 'chat-$V'"
echo "  SUBSCRIPTION: 'chat-$V-subscription'"
echo "----------------------------------"
echo ""
