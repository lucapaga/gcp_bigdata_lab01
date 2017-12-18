. 00_set_params.sh


if [ -z "$1" ]
then
	echo "Plese select a region.txt file"
	exit 1
fi

for aCity in $(cat $1); do
	./14_device_client_run_py.sh $aCity > log/$aCity.log &
done
