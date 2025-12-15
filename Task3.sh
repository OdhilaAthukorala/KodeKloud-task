#Activity was to disable all root acces login via ssh in all linux servers
#step1 login to the server using ssh
#get into as sudo user
#edit the /etc/ssh/sshd_config file and set PermitRootLogin to no
#restart the sshd service using systemctl restart sshd
ssh steve@Am3ric@
# give yes to login
# enter the password of the user steve. it is given in the kodekloud infarstucture detail guide
# now gain root access
sudo bash
# now edit the sshd_config file
sudo vi /etc/ssh/sshd_config
#press i to go to insert mode
# now edit the sshd_config file and set PermitRootLogin to no
#press esc to exit insert mode
# type :wq to save and exit the file (sshd_config file)
# now restart the sshd service
systemctl restart sshd