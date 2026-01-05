#the activity isto troubleshoot a apache web server
#first login to the app server
ssh tony@172.16.238.10
sudo -i
#put the password to login as root

#to see which port is used by apache web server check the configuration file
cat /etc/httpd/conf/httpd.conf | grep Listen
#or
sudo vi /etc/httpd/conf/httpd.conf 
#this will confirm port 8087 is being used by apache web server

#check the status of apache web server
systemctl status httpd
#when checking  the status it will show as disabled and inactive
#so we need to check if another process is using the port 8087
netstat -tupln | grep 8087
#also can use ss comand. for this have to install iproute
sudo dnf install iproute -y
sudo ss -tulpn | grep httpd
#it will shows that another process is using the port 8087.this will probably be sendmail process
#so we need to stop that process
systemctl stop sendmail
systemctl disable sendmail
#now start the apache web server
systemctl start httpd
#enable the apache web server to start at boot time
systemctl enable httpd
#now check the status of apache web server
systemctl status httpd
#try to access the webserver
curl http://stapp01:8087 #or curl http://172.16.238.10:8087

#this command will be executed on the host machine successfully but will fail in the jump machine
#the reason is the iptables are not allowing the incomingtraffic on port 8087
#so we have add port 8087 to accept tcp recquests
#this command will be executed on the app server
sudo iptables -I INPUT -p tcp --dport 6300 -j ACCEPT
sudo service iptables save

#try to access the webserver on jump machine
curl http://stapp01:8087 #or curl http://172.16.238.10:8087
#it will show the index.html page
