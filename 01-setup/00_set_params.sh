#!/bin/bash

 # Copyright 2017 Google Inc.
 #
 # Licensed under the Apache License, Version 2.0 (the "License");
 # you may not use this file except in compliance with the License.
 # You may obtain a copy of the License at
 #
 #     http://www.apache.org/licenses/LICENSE-2.0
 #
 # Unless required by applicable law or agreed to in writing, software
 # distributed under the License is distributed on an "AS IS" BASIS,
 # WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 # See the License for the specific language governing permissions and
 # limitations under the License.

projectID=tetrapak-2017-gcp-onboard-00
GCSProjectID=$projectID
echo "GCS Project is: $projectID"
#export projectID

#if you want to run the demo multiple times, just increment this variable
V=paganelli_1

#sandbox location for local operations
home=~/sandbox/t$V

flowName=flow_$V

# GOOGLE CLOUD STORAGE
gcsRegion=europe-west1
bucket=$projectID-iot-demo
tempLocation=$bucket/$flowName/temp/

# BIGQUERY
dataset=DemoIoT20171218_$V
table=$projectID:$dataset.$flowName

# DATAFLOW
jobName=dataflow-job-$flowName
maxWorkers=10

table=$projectID:$dataset.$flowName
dataflowzone=europe-west1-b
workerType=custom-4-8192

# PUB/SUB
topic=iot-temp-measures-$V
topicFullName=projects/$projectID/topics/$topic

# IoT CORE
iotzone=europe-west1
deviceName=demo-rs256-device-$flowName
registryName=device-registry-$flowName
