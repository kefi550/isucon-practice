#!/bin/bash

set -u

LOCAL_PATH="../../isucon9-q"

rsync -avr --exclude='node_modules' isu3:~/isucari/webapp/nodejs/ "${LOCAL_PATH}/isucari/webapp/nodejs/"
rsync -avr --exclude='initial.sql' isu3:~/isucari/webapp/sql/ "${LOCAL_PATH}/isucari/webapp/sql/"
rsync -avr --exclude='' isu1:/etc/nginx/ "${LOCAL_PATH}/nginx/isu1/"
rsync -avr --exclude='' isu2:/etc/nginx/ "${LOCAL_PATH}/nginx/isu2/"
rsync -avr --exclude='' isu3:/etc/nginx/ "${LOCAL_PATH}/nginx/isu3/"
rsync -avr --exclude='' isu2:/etc/mysql/ "${LOCAL_PATH}/mysql/"
  
