#!/bin/bash

. ../00_set_params.sh
python chat.py --subscription_name chat-$V-subscription --mode consume
