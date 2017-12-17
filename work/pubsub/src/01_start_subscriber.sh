#!/bin/bash

. ../00_set_params.sh
python chat.py --topic_name chat-$V --subscription_name chat-$V-subscription --mode consume
