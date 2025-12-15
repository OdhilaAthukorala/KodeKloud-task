#the activity is to give execute permission for a script to all users
# for this first we have to log into linux server then gain root access
ssh tony@172.16.238.10
# give yes to login
# enter the password of the user tony. it is given in the kodekloud infarstucture detail guide
# now gain root access
sudo bash
#now check current permission of the script
ls -l /tmp/xfusioncorp.sh
# now give execute permission to all users
chmod a+rx /tmp/xfusioncorp.sh # can use alternative-  sudo chmod 755 /tmp/xfusioncorp.sh


