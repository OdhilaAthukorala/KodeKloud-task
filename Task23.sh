#check if iptables are installed
iptables --version

#install iptables-services
sudo dnf install iptables-services -y

# Clear current INPUT rules to start fresh
sudo iptables -F INPUT

# Allow established connections (Critical for two-way communication)
sudo iptables -A INPUT -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT

# Allow Localhost
sudo iptables -A INPUT -i lo -j ACCEPT

# Allow LBR Host
sudo iptables -A INPUT -p tcp -s 172.16.238.14 --dport 8082 -j ACCEPT

# Drop everyone else on that port
sudo iptables -A INPUT -p tcp --dport 8082 -j DROP

# Save iptables rules to persist across reboots
sudo iptables-save | sudo tee /etc/sysconfig/iptables