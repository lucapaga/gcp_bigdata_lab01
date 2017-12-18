#!/bin/bash
. ../01-setup/00_set_params.sh

# CREATE TOPIC NAMED 'chat-$V' WITH CLI
# (https://cloud.google.com/sdk/gcloud/reference/beta/pubsub/topics/create)

# CREATE SUBSCRIPTION NAMED 'chat-$V-subscription' FOR TOPIC 'chat-$V' WITH CLI
# (https://cloud.google.com/sdk/gcloud/reference/beta/pubsub/subscriptions/create)

echo ""
echo "----------------------------------"
echo "         TOPIC: 'chat-$V'"
echo "  SUBSCRIPTION: 'chat-$V-subscription'"
echo "----------------------------------"
echo ""
