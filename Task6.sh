#the activity is to loginto a remote server install cronie package and start the crond service
#login to the remote server
ssh tony@172.16.238.10
# give yes to login
# enter the password of the user tony. it is given in the kodekloud infrastructure detail guide
# check the os details
cat /etc/os-release
# now gain root access
sudo -i
# install cronie package
sudo yum install cronie -y
# start the crond service
sudo systemctl start crond
# enable the crond service to start on boot
sudo systemctl enable crond
# check the status of crond service
sudo systemctl status crond
# creating a cron job which executes every five minitues to print hello in /tmp/cron_text file
#Open the Cron Table
crontab -e
#press i to go into insert mode
# add the following line at the end of the file
# */5 * * * * echo "hello" >> /tmp/cron_text
# press esc then type :wq to save and exit the file
#repeate this for all other linux app servers
exit

