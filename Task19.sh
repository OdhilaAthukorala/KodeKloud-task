#to setup a apache web server to serve 2 different web pages on the same port
ssh banner@172.16.238.12
sudo -i
systemctl status httpd
# if not installed install it using the below command
sudo dnf install httpd -y
sudo vi /etc/httpd/conf/httpd.conf
#change the port to 6300
   #listen:6300
   #!/bin/bash
<<COMMENT
    <VirtualHost *:6300>
    ServerName localhost
    DocumentRoot "/var/www/html"

    # This ensures Apache has permission to read these folders
    <Directory "/var/www/html">
        Options Indexes FollowSymLinks
        AllowOverride None
        Require all granted
    </Directory>
</VirtualHost>
COMMENT
#save and exit from the editor
sudo systemctl enable --now httpd
mkdir /var/www/html/blog
mkdir /var/www/html/games
exit
#copy the web pages to default directory( /var/www/html/)which used by apache to serve the web pages
#but we cannot directly copy into that since permission are denied
#therefore copy the file into /home/banner/ and then move it to /var/www/html/
#code to copy from jump host to app server
scp /home/thor/blog/index.html banner@172.16.238.12:/home/banner/
ssh banner@172.16.238.12
sudo -i
mv /home/banner/index.html /var/www/html/blog/
exit
#copy the games web page to app server
scp /home/thor/games/index.html banner@172.16.238.12:/home/banner/
ssh banner@172.16.238.12
sudo -i
mv /home/banner/index.html /var/www/html/games/
systemctl restart httpd
#now check if we can access the web pages using the below command
curl http://localhost:6300/blog
curl http://localhost:6300/games
exit