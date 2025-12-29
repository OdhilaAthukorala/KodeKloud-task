Activity is to install a tomcat server on a remote server and host a file to serve it in a particular port
first install java development kit (jdk)

ssh tony@172.16.238.10
sudo -i
#put the passowrd to login as root

#install tomcat server
yum install tomcat -y

#navigate to tomcat configuration file and change the port number if recquired
sudo vi /usr/share/tomcat/conf/server.xml
#go to insert mode by pressing I
#change the port number from 8080 to 5000 in the connector section

#logout as root user
exit
#now logout from the remote server
exit
#now copy the ROOT.war file to the remote server
#this should be copied into the /tmp directory of the remote server
scp /tmp/ROOT.war steve@172.16.238.11:/tmp
#put the password to copy the file

login to remote server again
ssh steve@172.16.238.11
sudo -i
#put the password to login as root

# Clear existing ROOT application
#/var/lib/tomcat/webapps/  directory holds the web applications serverd from tomcat server
#so we need to clear any existing ROOT application before deploying new one
#also we can serve several other files by copying other war files into the same directory
sudo rm -rf /var/lib/tomcat/webapps/ROOT
sudo rm -rf /var/lib/tomcat/webapps/ROOT.war

#now move the ROOT.war file from /tmp to /var/lib/tomcat/webapps/
sudo mv /tmp/ROOT.war /var/lib/tomcat/webapps/

#start the tomcat server and enable it
sudo systemctl start tomcat
sudo systemctl enable tomcat

# Verify the port is listening
netstat -tupln | grep 5000

#now check if the file is served by tomcat server
curl http://stapp02:5000  #or curl http://172.16.238.11:5000
