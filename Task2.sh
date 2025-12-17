# Tempory user setup with expiry date
# for this first we have to log into linux server then gain root access
# then get using sudo useradd -e YYYY-MM-DD  <username> create the user

ssh steve@172.16.238.11
# give yes to login
# enter the password of the user steve. it is given in the kodekloud infarstucture detail guide
# now create the new user with expiry date
sudo useradd -e 2024-04-10 yousuf
