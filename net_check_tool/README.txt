使用此工具检查集群网络连通情况
1. bash net_check_tool.sh [-h] 来获取帮助;

2. bash net_check_tool.sh -c [集群uuid1,集群uuid2,...] -n [网卡名];

3. ping失败记录存放在 /tmp/net_check_result/ 目录下;

4. 如果有ansible执行报错，请检查物理机连接状态;

5. 当然你也可以自定义ansible.conf文件，执行命令 ansible-playbook -i ansible.conf net_check.yaml --extra-vars="nic_name=[网卡名]" 来检查非同一集群物理机的网络连通情况。