class role_maven_server {

  yum::group { 'Development Tools':
    ensure => present
  }

  package { 'maven':
    ensure => installed
  }

  file { '/etc/maven/settings.xml':
    source => [
      "puppet:///modules/role_maven_server/settings.xml"
    ]
  }

  file { '/home/vagrant/pom.xml':
    source => [
      "puppet:///modules/role_maven_server/pom.xml"
    ]
  }
}
