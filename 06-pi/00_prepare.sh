#!/bin/bash
. ../01-setup/00_set_params.sh

# CREATE TOPIC NAMED 'chat-$V' WITH CLI
# (https://cloud.google.com/sdk/gcloud/reference/beta/pubsub/topics/create)
#gcloud beta pubsub topics create chat-$V

# CREATE SUBSCRIPTION NAMED 'chat-$V-subscription' FOR TOPIC 'chat-$V' WITH CLI
# (https://cloud.google.com/sdk/gcloud/reference/beta/pubsub/subscriptions/create)
gcloud beta pubsub subscriptions create $topic-sub-cli --topic=$topic

echo ""
echo "----------------------------------"
echo "         TOPIC: '$topic'"
echo "  SUBSCRIPTION: '$topic-sub-cli'"
echo "----------------------------------"
echo ""
