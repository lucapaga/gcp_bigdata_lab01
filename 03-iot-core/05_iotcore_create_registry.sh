. 00_set_params.sh

echo "REGISTRY NAME: $registryName"
echo "      PROJECT: $GCSProjectID"
echo "       REGION: $iotzone"
echo "        TOPIC: $topicFullName"

gcloud beta iot registries create $registryName \
    --project=$GCSProjectID \
    --region=$iotzone \
    --event-pubsub-topic=$topicFullName

