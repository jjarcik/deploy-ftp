# Sync your folder with FTP

How to sync local folder with remote FTP.
- lftp - https://lftp.yar.ru/

```shell
$ ./deploy.sh
$ ./deploy.sh README.md
```


## configuration

```
#!/bin/bash    
HOST="HOST"
USER="USER"
PASS="PASS"
FTPURL="ftp://$USER:$PASS@$HOST"
LCD="./"
RCD="/www/"
DELETE="--delete"

if [ "$#" -eq  "0" ]
    then
        lftp -c "set ftp:list-options -a;
        open '$FTPURL';
        lcd $LCD;
        cd $RCD;
        mirror --reverse \
            $DELETE \
            --verbose \
            --exclude-glob  www/upload/ \
            --exclude-glob  .DS_Store \
            --exclude-glob .deploy.sh \
            --exclude-glob  node_modules/ \
            --exclude-glob  fe/ \
            --exclude-glob  podklady/ \
            --exclude-glob  .vscode/ \
            --exclude-glob  temp/ \
            --exclude-glob  www/cms/js/lib/ \
            --exclude-glob  log/ \
            --exclude-glob .git/"
    else
        RCD="$RCD/$(dirname $1)"
        echo "upload a file: " $1 "to" $RCD
        lftp -c "set ftp:list-options -a;
        open '$FTPURL';
        lcd $LCD;
        cd $RCD;
        put $1"
fi

```

### docs
- https://lftp.yar.ru/lftp-man.html
- https://serverfault.com/questions/24622/how-to-use-rsync-over-ftp
