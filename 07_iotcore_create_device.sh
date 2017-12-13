. 00_set_params.sh

gcloud beta iot devices create $deviceName \
  --project=$projectID \
  --region=$iotzone \
  --registry=$registryName \
  --public-key path=device_keys/rsa_cert.pem,type=rs256
