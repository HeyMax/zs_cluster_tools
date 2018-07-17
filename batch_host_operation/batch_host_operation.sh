#!/bin/bash
usage(){
        echo "Usage: bash $0 -e [script_path]"
        #echo "  -e.g. bash $0 -e /usr/update.sh"
}

fetch(){
	F_SRC=$1
	F_DEST=$2
	ansible all -m fetch -a "src=$F_SRC dest=$F_DEST" -i inventory
}

help(){
	echo -e "\nThe script distributes tasks to all hosts in ZStack\n"
	usage
	echo -e "\nFetch the result: bash $0 -e [script_path] -f [result_path]\nSuch as: bash $0 -e /usr/check.sh -f /tmp/check.log"
        echo -e "\nSpecify the cluster: bash $0 -c [cluster_uuid_1,cluster_uuid_2,...] -e [script_path]"
}

python ./ssh_info.py
while getopts "c:e:f:" opt; do
	case $opt in
	  c )
	     python ./ssh_info.py $OPTARG
             ;;
	  e )
	     FILE_PATH=$(echo "$OPTARG" | rev | cut -d'/' -f1 | rev)
	     if [[ -e $OPTARG ]]
	     then
	 	 cp $OPTARG ./$FILE_PATH
	     fi
	     ansible-playbook batch_host_operation.yaml --extra-vars "file_path=$FILE_PATH" -i inventory
	     rm -f ./$FILE_PATH
	     ;;
	  f )
	     fetch $OPTARG $(echo /tmp/)
	     ;;
	  * )
	     help
	     ;;
	esac
done
