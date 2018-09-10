# Sync your folder with FTP

How to sync local folder with remote FTP.
- lftp - https://lftp.yar.ru/

```shell
$ ./deploy.sh
```


## configuration

```
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

```

### docs
- https://lftp.yar.ru/lftp-man.html
- https://serverfault.com/questions/24622/how-to-use-rsync-over-ftp
