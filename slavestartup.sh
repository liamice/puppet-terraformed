#!/bin/bash
#download puppet release
sudo wget https://apt.puppet.com/puppet-release-bionic.deb -P /etc

#add with dpkg
sudo dpkg -i /etc/puppet-release-bionic.deb

#update
sudo apt-get update

#Install Puppet-Agent
sudo apt-get install -y puppet-agent

#enable "puppet" CLI to be used anywhere (not just /opt/puppetlabs/bin)
export PATH=/opt/puppetlabs/bin:$PATH

echo "*****   Installation Complteted!!   *****"

echo "Welcome to Google Compute VM Instance deployed using Terraform!!!"

echo "*****   Startup script completes!!    *****"