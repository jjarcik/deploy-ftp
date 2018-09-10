#!/bin/bash    
HOST="HOST"
USER="USERNAME"
PASS="PASSWORD"
FTPURL="ftp://$USER:$PASS@$HOST"
LCD="./"
RCD="/"
DELETE="--delete"
lftp -c "set ftp:list-options -a;
open '$FTPURL';
lcd $LCD;
cd $RCD;
mirror --reverse \
       $DELETE \
       --verbose \
       --exclude-glob  www/upload/ \
       --exclude-glob  .DS_Store \
       --exclude-glob .git/"
