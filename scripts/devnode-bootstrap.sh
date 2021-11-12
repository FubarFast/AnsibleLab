# Import the public repository GPG keys
curl https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -

# Update time settings
sudo cp /usr/share/zoneinfo/America/New_York /etc/localtime
sudo ntpdate time.google.com

# Register the Microsoft Ubuntu repository
curl https://packages.microsoft.com/config/ubuntu/20.04/prod.list | sudo tee /etc/apt/sources.list.d/microsoft.list

# Update the list of products
sudo apt-get update
sudo apt-get dist-upgrade

# Install PowerShell
sudo apt-get install -y powershell

# Install GUI
# sudo apt-get install -y ubuntu-desktop

# Install Ansible
sudo apt-get install -y ansible

# Install Python3 pip
sudo apt-get -y install python3-pip

# Set ansible inventory to targetnode
sudo cat > /etc/ansible/hosts << ENDOFFILE
[servers]
targetnode ansible_host=10.10.0.20

[all:vars]
ansible_python_interpreter=/usr/bin/python3
ENDOFFILE

# Copy the vagrant generated private key (which the host uses to connect to targetnode via vagrant)
# to devnode so it may connect to targetnode via ansible.
sudo cp /vagrant/.vagrant/machines/targetnode/virtualbox/private_key /home/vagrant/.ssh/id_rsa

# update permissions
sudo chmod 777 /home/vagrant/.ssh/id_rsa
