#!/bin/sh

# Add bootstrap modules
mkdir -p /root/bootstrap/modules
puppet module install --modulepath=/root/bootstrap/modules jlambert121/puppet --version 0.7.0
puppet module install --modulepath=/root/bootstrap/modules zack/r10k --version 3.2.0
puppet module install --modulepath=/root/bootstrap/modules stahnma/epel --version 1.2.2
puppet module install --modulepath=/root/bootstrap/modules hunner/hiera --version 1.4.1

# Configure the master, hiera, and r10k services
puppet apply --modulepath=/root/bootstrap/modules master.pp && \
puppet apply --modulepath=/root/bootstrap/modules hiera.pp && \
puppet apply --modulepath=/root/bootstrap/modules r10k_installation.pp && \
# If everything went well, deploy using r10k
r10k deploy environment -p


# If everything is successful, run puppet, otherwise alert
if [ $? -eq 0 ]
then
  # Ensure changes to hiera and the master configuration are in place before continuing
  systemctl restart puppetserver
  puppet agent -t
  systemctl enable puppet
  systemctl start puppet
else
  echo "Some part of the bootstrap process failed. Investigate the errors and proceed with manual bootstrapping."
  echo ""
  echo "See https://github.com/puppetinabox/documentation#bootstrap for the steps."
  echo ""
fi
