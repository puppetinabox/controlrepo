# If we are going to add anything other than RHEL6 to the environment,
# make the "6" into a variable that is read dynamically
# for example: lsb_release -a | grep ^Release | awk '{print $2}' | cut -d'.' -f1
class { '::yum':
  
  repos => {
    
    'puppetlabs-products' => {
      descr    => 'Puppet Labs Products El 6 - $basearch',
      baseurl  => 'http://yum.puppetlabs.com/el/6/products/$basearch',
      gpgkey   => 'https://yum.puppetlabs.com/RPM-GPG-KEY-puppetlabs',
      enabled  => '1',
      gpgcheck => '1',
    },
    
    'puppetlabs-deps' => {
      descr    => 'Puppet Labs Dependencies El 6 - $basearch',
      baseurl  => 'http://yum.puppetlabs.com/el/6/dependencies/$basearch',
      gpgkey   => 'https://yum.puppetlabs.com/RPM-GPG-KEY-puppetlabs',
      enabled  => '1',
      gpgcheck => '1',
    },
    
  }

}

