# first login to db server and set up mariadb 
ssh peter@172.16.239.10
sudo -i
#put the password to login as root
#check if mariadb is installed
systemctl status mariadb
# if not installed install it using the below command
sudo dnf install mariadb-server -y
#start the mariadb service
systemctl enable --now mariadb
#login to mariadb shell
sudo mariabd
#code inside the mariadb shell
<<'COMMENT'
 CREATE DATABASE kodekloud_db8;
 CREATE USER 'kodekloud_cap'@'%' IDENTIFIED BY 'YchZHRcLkL';
 GRANT ALL PRIVILEGES ON kodekloud_db8.* TO 'kodekloud_cap'@'%';
 \q
COMMENT
#exit from the server
exit
#login to load balancer server and set up haproxy
ssh loki@172.16.238.14
sudo -i
sudo vi /etc/haproxy/haproxy.cfg
<<'COMMENT'
 frontend myAppFrontEnd
  bind *:80
  use_backend webservers 
 backend webservers
    balance roundrobin
    server web 1 172.16.238.10:8082 check
    server web 2 172.16.238.11:8082 check
    server web 3 172.16.238.12:8082 check
COMMENT
# now restart haproxy service
sudo systemctl restart haproxy
exit

#login to the app servers and install httpd and php dependencies on all the 3 app servers
ssh tony@172.16.238.10
sudo -i
sudo dnf install httpd -y
sudo dnf install php php-gd php-curl php-mysqlnd php-json php-opcache php-xml -y
sudo vi /etc/httpd/conf/httpd.conf
#change the port to 8082
sudo systemctl enable --now httpd

