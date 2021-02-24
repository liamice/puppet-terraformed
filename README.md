# puppet-terraformed

A Puppet master & slave server deployed with one command through terraform 

```bash
terraform init && terraform apply
```

Usage:

1) Add the correct variables in the "variables.tf" file
2) Run "Terraform init" to initialize Terraform and download dependencies
3) Run "Terraform apply" to deploy


This will deploy a puppet master and slave server, however it does not configure them

Configuration: 

Master:

```bash
puppetserver ca setup   #setup certs

sudo /opt/puppetlabs/bin/puppet resource service puppetserver ensure=running    #start puppetserver
```

Slave:

```bash
sudo nano /etc/hosts    #open hosts file in nano
```
edit the hosts file:
<puppet_master_internal_ip> puppet 
```bash
sudo puppet resource service puppet ensure=running  #start agent service

sudo /opt/puppetlabs/bin/puppet agent -t    #run agent
```

Back to the master:

```bash
sudo /opt/puppetlabs/bin/puppetserver ca list   #list requested certs

sudo /opt/puppetlabs/bin/puppetserver ca sign --al  #sign all requested certs
```

puppet agent config:
/etc/puppetlabs/puppet/puppet.conf

Add puppet to profile:
```bash
sudo nano ~/.profile
```
add the following entry
```bash
PATH=$PATH:/opt/puppetlabs/puppet/bin
```
```bash
exec bash   #open new bash

source ~/.profile   #use new profile
```

Puppet control repo:

to create a puppet control repo - create a new github repo and set the default branch to "production"


Puppet DB Setup (optional):

On Master server
```bash
sudo /opt/puppetlabs/bin/puppet resource package puppetdb ensure=latest

