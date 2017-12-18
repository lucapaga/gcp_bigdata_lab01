. 00_set_params.sh

echo "  PROJECT: $projectID"
echo " REGISTRY: $registryName"
echo "   DEVICE: $deviceName"

cd src/java/mqtt_example

echo ""
echo ""
echo "-------------------------------------------------------"
echo "BUILDING device ..."
mvn clean compile

echo ""
echo ""
echo "-------------------------------------------------------"
echo "STARTING device ..."
mvn exec:java \
	-Dexec.mainClass="com.google.cloud.iot.examples.MqttExample" \
	-Dexec.args="-project_id='$projectID' -registry_id='$registryName' -device_id='$deviceName' -private_key_file=../../../device_keys/rsa_private_pkcs8 -algorithm=RS256 -mqtt_bridge_port=443 -num_messages=10"

cd ../../..
