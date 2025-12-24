# The activity is to install ansible in the jump host and the access app servers to automatically run scripts using ansible
# first check for python3 version
python3 --version
# check is ansible is installed
ansible --version
# if not 
sudo pip install ansible==4.8.0
#now verify the installation
ansible --version
