#The activity is to install selinux on a remote server and set the selinx status to disable
#by editing the etc/selinux/config file
# for this first we have to log into linux server then gain root access
ssh banner@172.16.238.12	
# give yes to login
# enter the password of the user banner. it is given in the kodekloud infarstucture detail guide
cat /etc/os-release
# now gain root access
sudo bash

# now install selinux packages
sudo yum install policycoreutils selinux-policy-targeted libselinux-utils -y
# open selinux config file using vi editor
sudo vi /etc/selinux/config
#press i to go to insert mode
# change the line SELINUX=enforcing to SELINUX=disabled
# press esc then type :wq to save and exit the file
# now reboot the server to apply the changes
