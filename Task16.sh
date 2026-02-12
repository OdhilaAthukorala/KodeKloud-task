# The task is to configure the database server to create a new database user and grant access to a newly created database
# First ssh into the database server
ssh peter@172.16.239.10
#enter the password
# Switch user to postgres
sudo su - postgres
#postgres: This is the default administrative account created automatically when PostgreSQL is installed.
#This means if you are logged into the OS as the user postgres, the database will 
# automatically let you in as the database superuser postgres without asking for a password.
# next launch psql interactive terminal
psql
#Now that you are acting as the postgres user, typing psql opens the 
# command-line interface where you can actually run SQL queries and manage the database.
# You will know you are successful when your command prompt changes to postgres=#
# now create a new user called 'kodekloud_top' with a password by sql command
CREATE ROLE kodekloud_top WITH LOGIN PASSWORD 'TmPcZjtRQx';
#create a new database
CREATE DATABASE kodekloud_db3;
#grant all privileges to the new user for the database kodekloud_db3
GRANT ALL PRIVILEGES ON DATABASE kodekloud_db3 TO kodekloud_top;
#exit prostgres shell
\q
exit