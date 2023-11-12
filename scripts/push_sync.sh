#!/bin/bash

set -u

LOCAL_PATH="../../isucon9-q"

rsync -avr --exclude='node_modules' "${LOCAL_PATH}/isucari/webapp/nodejs/" isu1:~/isucari/webapp/nodejs/ 
ssh isu1 sudo systemctl restart isucari.nodejs.service
rsync -avr --exclude='node_modules' "${LOCAL_PATH}/isucari/webapp/nodejs/" isu2:~/isucari/webapp/nodejs/ 
# ssh isu2 sudo systemctl restart isucari.nodejs.service
rsync -avr --exclude='node_modules' "${LOCAL_PATH}/isucari/webapp/nodejs/" isu3:~/isucari/webapp/nodejs/ 
ssh isu3 sudo systemctl restart isucari.nodejs.service
rsync -avr --exclude='node_modules' "${LOCAL_PATH}/isucari/webapp/sql/" isu1:~/isucari/webapp/sql/ 
rsync -avr --exclude='node_modules' "${LOCAL_PATH}/isucari/webapp/sql/" isu2:~/isucari/webapp/sql/ 
rsync -avr --exclude='node_modules' "${LOCAL_PATH}/isucari/webapp/sql/" isu3:~/isucari/webapp/sql/ 
rsync -avr --exclude='initial.sql' "${LOCAL_PATH}/isucari/webapp/sql/" isu1:~/isucari/webapp/sql/
rsync -avr --exclude='initial.sql' "${LOCAL_PATH}/isucari/webapp/sql/" isu2:~/isucari/webapp/sql/
rsync -avr --exclude='initial.sql' "${LOCAL_PATH}/isucari/webapp/sql/" isu3:~/isucari/webapp/sql/
# rsync -avr --exclude='' "${LOCAL_PATH}/nginx/" isu1:/etc/nginx/
# rsync -avr --exclude='' "${LOCAL_PATH}/mysql/" isu2:/etc/mysql/
  
