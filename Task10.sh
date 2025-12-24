#The activity is to loginto app server then create a bash script to automatically create a archive file
# the archive file then should be copied to the backup server from the app server
#using scp command

#login to app server
ssh banner@172.16.238.12
#now install zip utility if not installed
sudo yum install zip -y
#now login as root user
sudo -i
#check if backup directory is created if not create it
ls -d /backup
#if not present create backup directory
mkdir -p /backup
#check if scripts directory is created if not create it
ls -d /scripts
#if not present create scripts directory
mkdir -p /scripts
#create a passwordless login to backup server
ssh-keygen -t rsa -b 4096
#copy the public key to backup server
ssh-copy-id clint@172.16.238.16
#login to backup server to verify passwordless login
ssh clint@172.16.238.16
#exit from backup server to app server
exit
#now create a bash script to create archive file and copy to backup server
sudo vi /scripts/news_backup.sh
#go into insert mode by pressing I and add the following lines
: <<'END_COMMENT'
    #!/bin/bash

    # Define variables
    SOURCE_DIR="/var/www/html/news"
    DEST_DIR="/backup"
    DEST_FILE="$DEST_DIR/xfusioncorp_news.zip"
    REMOTE_USER="clint"
    REMOTE_HOST="172.16.238.16"
    REMOTE_DEST="/backup/"

    # 1. Navigate to source directory
    cd /var/www/html

    # 2. Create the zip file
    # We assume /backup/ exists because we created it manually in Step 1
    zip -rq "$DEST_FILE" news

    scp "$DEST_FILE" "$REMOTE_USER@$REMOTE_HOST:$REMOTE_DEST"

END_COMMENT

#change the file permission to make executable
chmod +x /scripts/news_backup.sh    # or use chmod 755 /scripts/news_backup.sh
#now run the script to verify
bash /scripts/news_backup.sh
#now login to backup server to verify the file is copied
ssh clint@172.16.238.16
#inspect the /backup directory of the backup server for the file xfusioncorp_news.zip
ls /backup
#exit from backup server
exit
