# puppet-terraformed

A Puppet master & slave server deployed with one command through terraform 

```bash
terraform init && terraform apply
```

Usage:

1) Add the correct variables in the "variables.tf" file
2) Run "Terraform init" to initialize Terraform and download dependencies
3) Run "Terraform apply" to deploy


This will deploy a puppet-master as well as a puppet-slave. However it does not configre them, configuration must be completed manually:

set the server setting to your Puppet master’s hostname with the following command: puppet config set server <MASTER FDQN> --section main.

For other settings you might want to change, see a list of agent-related settings.

Start the puppet service: sudo /opt/puppetlabs/bin/puppet resource service puppet ensure=running enable=true.

(Optional) To see a sample of Puppet agent’s output and verify any changes you may have made to your configuration settings in step 5, manually launch and watch a Puppet run: sudo /opt/puppetlabs/bin/puppet agent --test

Sign certificates on the certificate authority (CA) master.

On the Puppet master:

Run sudo /opt/puppetlabs/bin/puppet cert list to see any outstanding requests.
Run sudo /opt/puppetlabs/bin/puppet cert sign <NAME> to sign a request.
As each Puppet agent runs for the first time, it submits a certificate signing request (CSR) to the CA Puppet master. You must log into that server to check for and sign certificates. After an agent’s certificate is signed, it regularly fetches and applies configuration catalogs from the Puppet master.