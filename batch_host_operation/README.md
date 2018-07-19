# ZS集群物理机分发任务工具
  指定集群执行任务

## 帮助

    #获取帮助
    bash batch_host_operation.sh [-h]

    #使用
    bash batch_host_operation.sh -c [集群uuid1,集群uuid2,...] -e [脚本路径] -f [远端日志输出路径];
    
    #自定义ansible.conf文件,执行任务并搜集日志
    ansible-playbook -i ansible.conf batch_host_operation.yaml --extra-vars "file_path=[脚本路径]"  
    ansible all -m fetch -a "src=[远端日志路径] dest=[本地存放路径]"-i ansible.conf .
    
fetch的远端日志存放在 /tmp/ 目录下;

如果有ansible执行报错，请检查物理机连接状态;

## 使用示例

示例脚本程序(/test.sh)

    #!/bin/bash
    echo "hello, $(hostname)!" >> /tmp/flag
    EOF

管理节点上执行

    bash batch_host_operation.sh -c [集群uuid1,集群uuid2,...] -e /test.sh -f /tmp/flag

即可在指定集群上执行 test.sh 并搜集 test.sh 中的输出重定向记录文件
