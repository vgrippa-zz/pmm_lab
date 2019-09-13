# Install VirtualBox dependencies
sudo yum install -y epel-release
sudo yum install -y gcc dkms make qt libgomp patch
sudo yum install -y kernel-headers kernel-devel binutils glibc-headers glibc-devel font-forge

# Instal VB repo
cd /etc/yum.repos.d/
wget http://download.virtualbox.org/virtualbox/rpm/rhel/virtualbox.repo

# Install VirtualBox
sudo yum -y install VirtualBox-5.2

# Vagrant
cd /
sudo wget https://releases.hashicorp.com/vagrant/2.2.5/vagrant_2.2.5_x86_64.rpm
sudo rpm -ivh vagrant_2.2.2_x86_64.rpm

echo "10.0.0.10 pg-master" >> /etc/hosts
echo "10.0.0.11 pg-replica" >> /etc/hosts
echo "10.0.0.21 pxc-node1" >> /etc/hosts
echo "10.0.0.22 pxc-node2" >> /etc/hosts
echo "10.0.0.23 pxc-node3" >> /etc/hosts
echo "10.0.0.24 mysql-replica" >> /etc/hosts
echo "10.0.0.12 app-server" >> /etc/hosts
echo "10.0.0.14 mongo1" >> /etc/hosts
echo "10.0.0.15 mongo2" >> /etc/hosts
echo "10.0.0.16 mongo3" >> /etc/hosts

# Ansible
sudo yum install -y ansible

# Allow root login remotely
# Optionally
sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/g'  /etc/ssh/sshd_config
sed -i 's/#PermitRootLogin/PermitRootLogin/g'  /etc/ssh/sshd_config
echo "percona" | passwd --stdin root

# Installing docker and PMM on localhost
ansible-playbook /pmm_lab/provision/playbook_localhost.yml

echo 'Please, reboot the server'
