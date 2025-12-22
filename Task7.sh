# the activity is let thor jump host to loginto the app server with entering password
# for that we have to create the private and public key in the thor jump host machine and copy the public key 
# to the respective app server

sh-keygen -t rsa -b 4096

#now copy the public key to respective app servers
ssh-copy-id tony@172.16.238.10	
ssh-copy-id steve@172.16.238.11
ssh-copy-id banner@172.16.238.12

#to verify the passwordless login try to login without password
ssh tony@172.16.238.10