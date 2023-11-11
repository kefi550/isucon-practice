#!/bin/bash

set -u

LOCAL_PATH="../../isucon9-q"

rsync -avr --exclude='node_modules' isu1:~/isucari/webapp/nodejs/ "${LOCAL_PATH}/isucari/webapp/nodejs/"
rsync -avr --exclude='' isu1:/etc/nginx/ "${LOCAL_PATH}/nginx/"
rsync -avr --exclude='' isu2:/etc/mysql/ "${LOCAL_PATH}/mysql/"
  
