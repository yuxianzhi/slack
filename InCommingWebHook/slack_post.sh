#!/bin/bash

#yuor slack channel incomming webhook
SLACK_INCOMMING_WEBHOOK=""

MESSAGE_CONTENT='payload='

#读入输入json格式文件内容
while read line
do
    MESSAGE_CONTENT=$MESSAGE_CONTENT$line
done < $1

#字符替换" "到"%20"
MESSAGE_CONTENT=${MESSAGE_CONTENT// /%20}

MESSAGE_CONTENT=$MESSAGE_CONTENT
echo $MESSAGE_CONTENT

#post data
curl -X POST --data $MESSAGE_CONTENT $SLACK_INCOMMING_WEBHOOK
