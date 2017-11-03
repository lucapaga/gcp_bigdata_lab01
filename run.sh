. set_params.sh

#create the $tempLocation in CloudStorage
gsutil mb gs://$bucket/ && touch a-file && echo "temp" > a-file && gsutil cp a-file gs://$tempLocation && rm a-file

mkdir -p $home
cd $home

#create pubsub topic
gcloud beta pubsub topics create $topic

#create CloudIoT instance
gcloud beta iot registries create $registryName \
    --project=$projectID \
    --region=$iotzone \
    --event-pubsub-topic=$topicFullName

#clone from github
git clone https://github.com/aulisse/java-docs-samples/

#generate keys
./java-docs-samples/iot/api-client/generate_keys.sh

#register a device
gcloud beta iot devices create $deviceName \
  --project=$projectID \
  --region=$iotzone \
  --registry=$registryName \
  --public-key path=rsa_cert.pem,type=rs256

#create BigQuery Table - https://cloud.google.com/bigquery/bq-command-line-tool
bq mk -t $table message:string,city:string,temperature:float,hour:integer

#run pipeline
curl -X POST -H "Content-Type: application/json" -H "Authorization: Bearer $(gcloud auth print-access-token)" https://dataflow.googleapis.com/v1b3/projects/ulisse-32a7e/templates:launch?gcsPath=gs://dataflow-templates/pubsub-to-bigquery/template_file -d  '{"jobName":"'$jobName'","parameters":{"topic":"'$topicFullName'","table":"'$table'"},"environment":{"tempLocation":"gs://'$tempLocation'","maxWorkers":"'$maxWorkers'","zone":"'$dataflowzone'"}}'

#run client
cd $home/java-docs-samples/iot/api-client/mqtt_example

# modify code:
# 1) line 159 - String payload = String.format("{\"message\":\"%s/%s-message-%d\",\"city\":\"Milan\",\"temperature\":\""+(20+new java.util.Random().nextDouble()*5)+"\",\"hour\":\""+(new java.util.Random().nextInt(24))+"\"}", options.registryId, options.deviceId, i);
# 2) line 172 - sleep 300 ms 
# 3) numMessages = 1000 in the options file 
mvn clean compile
mvn exec:java -Dexec.mainClass="com.google.cloud.iot.examples.MqttExample" -Dexec.args="-project_id='$projectID' -registry_id='$registryName' -device_id='$deviceName' -private_key_file=../../../../rsa_private_pkcs8 -algorithm=RS256"

bq query "select count(*) as count FROM [$table]"
bq query "SELECT hour, avg(temperature) as avg_temp FROM [$table] group by hour order by hour asc"