. 00_set_params.sh

cd src/python/mqtt_client/

ls -l

#virtualenv env
#source env/bin/activate

#pip install -r requirements.txt

ls -l ../../../device_keys/rsa_private_pkcs8

python cloudiot_mqtt_example.py \
	--project_id $projectID \
	--registry_id $registryName \
	--device_id $deviceName \
        --private_key_file ../../../device_keys/rsa_private.pem \
	--algorithm RS256 \
	--cloud_region $iotzone \
	--num_messages 1000 \
	--ca_certs ../../../device_keys/roots.pem 

#	--num_messages 1000 \
#	--message_type event \
#	--mqtt_bridge_hostname \
#	--mqtt_bridge_port 443 \
	
