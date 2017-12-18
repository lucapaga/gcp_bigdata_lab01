#!/bin/bash

. ../00_set_params.sh

gcloud beta pubsub topics publish chat-$V "$*"
