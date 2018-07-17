#!/bin/bash
usage(){
  echo -e "Such as: bash net_check.sh -c [cluster_uuid_1,cluster_uuid_2...] -n [nic_name]"
  exit 77
}

net_check(){
  if [ -f ./ansible.conf ] 
  then
    ansible-playbook -i ./ansible.conf net_check.yaml --extra-vars="nic_name=$NIC_NAME"
  else
    usage
  fi
}

while getopts "c:n:" opt;
do
  case $opt in
    c )
      sudo python ./ssh_info.py $OPTARG
      ;;
    
    n )
      NIC_NAME=$OPTARG
      net_check
      ;;

    * )
      usage
      ;;     
  esac
done

if [ -d /tmp/net_check_result/ ]
then
  sudo python net_check_result.py
fi
