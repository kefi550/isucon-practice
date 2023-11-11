#!/bin/bash

set -u

LOCAL_PATH="../../isucon9-q"

rsync -avr --exclude='node_modules' "${LOCAL_PATH}/isucari/webapp/nodejs/" isu1:~/isucari/webapp/nodejs/ 
rsync -avr --exclude='' "${LOCAL_PATH}/nginx/" isu1:/etc/nginx/
rsync -avr --exclude='' "${LOCAL_PATH}/mysql/" isu2:/etc/mysql/
  
