#Activity is to run apache web server on port 8089.
#In one of the server port 8089 was used by sendmail service.
#in the other two server the apache webserver was configured to run on a differnt port
#so the activity is to troubleshoot and make the apache webserver run on port 8089 on all app servers
#first login to the respective app server
ssh tony@172.16.238.10
sudo -i
#put the password to login as root
#to see which port is used by apache web server check the configuration file
cat /etc/httpd/conf/httpd.conf | grep Listen
#to check if apache web server is running and active
systemctl status httpd
#it will show as inactive and disabled
#so we need to check if another process is using the port 8089
sudo netstat -tulpn | grep :8089
#it will shows that another process is using the port 8089.this will probably be sendmail process
#so we need to stop that process
sudo kill -9 708 #708 is the process id of that sendmail service. using the previous netstat command you can get PID
#check if the configuration file is set to listen on port 8089
grep "Listen" /etc/httpd/conf/httpd.conf
#if it is configuired to listen on a different port change it to 8089 by editing the file using vi editor
sudo vi /etc/httpd/conf/httpd.conf
#go to insert mode by pressing I
#change the port number to 8089 if it is different
#press esc then type :wq to save and exit the file
#now start the apache web server
systemctl start httpd
#verify it is started
systemctl status httpd

#for the other two app servers just check if the configuration file is set to listen 0n port 8089
#if not change it to 8089 and restart the apache web server