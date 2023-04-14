#!/bin/bash
set -e
exec &> /var/log/userdata.log

if ! command -v unzip &> /dev/null
then
    echo "unzip could not be found. Installing unzip..."
    sudo apt-get update
    sudo apt-get install unzip -y
fi

mkdir -p /opt/chef-automate/bin
cd /opt/chef-automate/bin

curl https://packages.chef.io/files/current/latest/chef-automate-cli/chef-automate_linux_amd64.zip | gunzip - > chef-automate && chmod +x chef-automate

echo "fs.file-max = 2097152" >> /etc/sysctl.conf
echo "vm.max_map_count = 262144" >> /etc/sysctl.conf
echo "vm.dirty_expire_centisecs =20000 " >> /etc/sysctl.conf
sysctl -p


# Get the public IP address of the instance
PUBLIC_IP=$(curl http://169.254.169.254/latest/meta-data/public-ipv4)

# Set the hostname to the public IP address
echo $PUBLIC_IP > /etc/hostname

# Reboot the instance
sudo reboot


