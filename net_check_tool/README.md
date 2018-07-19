# ZS集群网络连通检查工具
 使用此工具检查集群网络连通情况  
## 帮助
    #获取帮助
    bash net_check_tool.sh [-h];  
    
    #使用
    bash net_check_tool.sh -c [集群uuid1,集群uuid2,...] -n [网卡名];
    
    #自定义ansible.conf文件，来检查非同一集群物理机的网络连通情况  
    ansible-playbook -i ansible.conf net_check.yaml --extra-vars="nic_name=[网卡名]" 
