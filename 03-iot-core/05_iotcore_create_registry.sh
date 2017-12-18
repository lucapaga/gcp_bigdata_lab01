. ../01-setup/00_set_params.sh

echo "REGISTRY NAME: $registryName"
echo "      PROJECT: $GCSProjectID"
echo "       REGION: $iotzone"
echo "        TOPIC: $topicFullName"

# CREATE A DEVICE REGISTRY INTO CONFIGURED 'iotzone' TO WORK WITH PUB/SUB TOPIC
# DEFINED IN 'topicFullName'
# (https://cloud.google.com/sdk/gcloud/reference/beta/iot/registries/create)
