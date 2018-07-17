# -*- coding: UTF-8 -*-
'''
@author: ZhChen

Time synchronization checker
'''
import os,sys,re

bad_pings = os.popen("grep \" is bad\" -nir /tmp/net_check_result/").read()
if len(bad_pings):
	print "ping失败记录:"
	bad_pings = re.sub(r'\/.*result\/|\/.*bad_ping\.txt[-,:](\d)*[-,:]ip', "", bad_pings)
	print bad_pings
else:
	print "互ping成功"
