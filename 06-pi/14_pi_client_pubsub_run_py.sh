. ../01-setup/00_set_params.sh

## ---------------------------------------------------------------------------
##  FIRST OF ALL REVIEW THE CODE INTO ../src/python/mqtt_client/cloudiot_mqtt_example.py
## ---------------------------------------------------------------------------

cd ../src/python/pubsub-client-pi/

#ls -l

#virtualenv env
#source env/bin/activate

#pip install -r requirements.txt

#ls -l ../../../device_keys/rsa_private_pkcs8

if [ -z $1 ];
then

  python pi_pubsub_example.py \
  	--project_id $projectID \
    --pub_sub_topic $topic \
  	--num_messages 1000 \
  	--sensed_city "Bologna"

else

  python pi_pubsub_example.py \
  	--project_id $projectID \
    --pub_sub_topic $topic \
  	--num_messages 1000 \
    --sensed_city $1

fi
#	--num_messages 1000 \
#	--message_type event \
#	--mqtt_bridge_hostname \
#	--mqtt_bridge_port 443 \
