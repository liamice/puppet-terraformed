#!/bin/bash
#download puppet release
sudo wget https://apt.puppet.com/puppet-release-bionic.deb -P /etc

#add with dpkg
sudo dpkg -i /etc/puppet-release-bionic.deb

#update
sudo apt-get update

#install puppet master
sudo apt-get install -y puppetserver

#add with dpkg
sudo dpkg -i /etc/puppet-release-bionic.deb

#install puppet master
sudo apt-get install -y puppetserver

echo "*****   Installation Complteted!!   *****"

echo "Welcome to Google Compute VM Instance deployed using Terraform!!!"

echo "*****   Startup script completes!!    *****"