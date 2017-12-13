. 00_set_params.sh

bq mk $dataset

bq mk -t $table message:string,city:string,temperature:float,hour:integer
