class role_nexus_server {

  package { 'createrepo':
    ensure => installed
  }

  class{ '::java': }

  class{ '::nexus':
    version    => '2.14.4',
    revision   => '03',
    nexus_root => '/srv',
  }

  Class['::java'] ->
  Class['::nexus']
}

include role_nexus_server
