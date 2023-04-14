#!/bin/bash

# Set up error handling and logging
set -e
exec &> /var/log/userdata.log

# Define variables
package_name="chef-server-core_15.5.1-1_amd64.deb"

# Update the package index
echo "Updating package index..."
sudo apt-get update

if ! dpkg -s debconf-utils > /dev/null 2>&1; then
  sudo apt-get install -y debconf-utils
fi

# Set up debconf selections for Chef Server license agreement
echo "Configuring debconf selections for Chef Server license agreement..."
echo "chef-server-core chef-server/license select true" | sudo debconf-set-selections

# Install curl and Chef Server
echo "Installing curl..."
sudo apt-get install -y curl

echo "Installing Chef Server..."
if ! dpkg -s chef-server-core > /dev/null 2>&1; then
wget https://packages.chef.io/files/stable/chef-server/15.5.1/ubuntu/22.04/$package_name 
sudo dpkg -i $package_name
fi

# Configure Chef Server
echo "Configuring Chef Server..."
sudo chef-server-ctl reconfigure --chef-license accept

# Create a new user
sudo chef-server-ctl user-create janedoe Jane Doe janed@example.com 'abc123' --filename /home/ubuntu/janedoe.pem

# Create a new organization
sudo chef-server-ctl org-create 4thcafe 'Fourth Cafe, Inc.' --association_user janedoe --filename /home/ubuntu/manju-org-validator.pem
