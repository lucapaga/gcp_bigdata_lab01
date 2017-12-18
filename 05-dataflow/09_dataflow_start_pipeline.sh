. ../01-setup/00_set_params.sh

#DATAFLOW_JOB_DATA='{"jobName":"'$jobName'","parameters":{"topic":"'$topicFullName'","table":"'$table'"},"environment":{"tempLocation":"gs://'$tempLocation'","maxWorkers":"'$maxWorkers'","zone":"'$dataflowzone'"}}'
#echo $DATAFLOW_JOB_DATA

curl 	-X POST \
	-H "Content-Type: application/json" \
	-H "Authorization: Bearer $(gcloud auth print-access-token)" \
	https://dataflow.googleapis.com/v1b3/projects/$projectID/templates:launch?gcsPath=gs://dataflow-templates/pubsub-to-bigquery/template_file \
	-d '{"jobName":"'$jobName'","parameters":{"topic":"'$topicFullName'","table":"'$table'"},"environment":{"tempLocation":"gs://'$tempLocation'","maxWorkers":"'$maxWorkers'","zone":"'$dataflowzone'"}}'
