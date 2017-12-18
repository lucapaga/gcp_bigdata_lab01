. 00_set_params.sh
gcloud auth activate-service-account --key-file=../service-account/sa-tetrapak-demo.json sa-tetrapak-demo@tetrapak-2017-gcp-onboard-00.iam.gserviceaccount.com
gcloud config set project $projectID
export $GCLOUD_PROJECT
