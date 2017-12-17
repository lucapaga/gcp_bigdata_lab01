#!/bin/bash

gcloud beta pubsub topics publish chat-$V "$*"
