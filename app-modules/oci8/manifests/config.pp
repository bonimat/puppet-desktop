# == Class: oci8::config
#
# Defines default values for puppetboard parameters.
#
# Inherited by Class['oci8'].
#

class oci8::config inherits oci8{

file { '/usr/local/lib/instantclient-basic-linux.x64-12.2.0.1.0.zip':
      ensure => file,
      source => 'puppet:///modules/oci8/instantclient-basic-linux.x64-12.2.0.1.0.zip',
      }
file { '/usr/local/lib/instantclient-sdk-linux.x64-12.2.0.1.0.zip':
        ensure => file,
        source => 'puppet:///modules/oci8/instantclient-sdk-linux.x64-12.2.0.1.0.zip',
      }

file { '/usr/local/lib/instantclient-sqlplus-linux.x64-12.2.0.1.0.zip':
        ensure => file,
        source => 'puppet:///modules/oci8/instantclient-sqlplus-linux.x64-12.2.0.1.0.zip',
      }
file { '/usr/local/lib/instantclient_12_2/ldap.ora':
        ensure  => file,
        source  => 'puppet:///modules/oci8/ldap.ora',
        require => Exec['oci8 unzip1']
      }
file { '/usr/local/lib/instantclient_12_2/sqlnet.ora':
        ensure  => file,
        source  => 'puppet:///modules/oci8/sqlnet.ora',
        require => Exec['oci8 unzip1']
  }

#file { '/etc/php/7.0/mods-available/oci8.ini':
#        ensure => file,
#        source => 'puppet:///modules/oci8/oci8.ini',
#      }

file {'/tmp/answer-install-oci8':
        ensure  => file,
        content => template('oci8/answer-install-oci8.erb'),
      }
}
