#/bin/bash
mkdir -p /heapdump/${POD_NAME}
PS_NUMBER=`ps -ef|grep app.jar|grep -v grep|awk '{print $2}'`
jstack $PS_NUMBER > /heapdump/${POD_NAME}/${PS_NUMBER}.dump
jmap -histo $PS_NUMBER >/heapdump/${POD_NAME}/${PS_NUMBER}.histo
top -n 1 -Hbp  $PS_NUMBER >/heapdump/${POD_NAME}/${PS_NUMBER}.top
