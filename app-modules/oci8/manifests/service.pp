# == Class: oci8::service
#
# Defines default values for puppetboard parameters.
#

# Inherited by Class['oci8'].

class oci8::service (
  $oracle_instantclient_path = $oci8::params::oracle_instantclient_path,
  $oci8_class_connection     = $oci8::params::oci8_class_connection

  ) inherits oci8 {

  exec { 'oci8 unzip1':
    command => 'unzip /usr/local/lib/instantclient-basic-linux.x64-12.2.0.1.0.zip -d /usr/local/lib/',
    path    => '/sbin:/bin:/usr/sbin:/usr/bin',
    # unless  => "/usr/bin/php -m | grep -c oci8",
    # path    => [ '/usr/local/bin/', '/bin/' ],  # alternative syntax
  }
  exec { 'oci8 unzip2':
    command => 'unzip /usr/local/lib/instantclient-sdk-linux.x64-12.2.0.1.0.zip -d /usr/local/lib/ ' ,
    path    => '/sbin:/bin:/usr/sbin:/usr/bin',
    # unless  => "/usr/bin/php -m | grep -c oci8",
    # path    => [ '/usr/local/bin/', '/bin/' ],  # alternative syntax
  }
  exec { 'oci8 unzip3 ':
    command => 'unzip /usr/local/lib/instantclient-sqlplus-linux.x64-12.2.0.1.0.zip -d /usr/local/lib/',
    path    => '/sbin:/bin:/usr/sbin:/usr/bin',
    # unless  => "/usr/bin/php -m | grep -c oci8",
    # path    => [ '/usr/local/bin/', '/bin/' ],  # alternative syntax
  }
  exec {'symlink libclntsh.so ':
    		command => "ln -s /usr/local/lib/instantclient_12_2/libclntsh.so.12.1 /usr/local/lib/instantclient_12_2/libclntsh.so ",
        path    => '/sbin:/bin:/usr/sbin:/usr/bin',
        unless  => "test -e ${oracle_instantclient_path}/libclntsh.so"

    	}

#exec {'pecl-install-oci8':
#		command => "pecl install oci8 < /tmp/answer-install-oci8 > /tmp/output_pecl_oci8",
#    path    => '/sbin:/bin:/usr/sbin:/usr/bin',
#		unless  => "/usr/bin/php -m | grep -c oci8",
#    require => File['/tmp/answer-install-oci8']
#
#
#	}
#  exec {'module oci8 enable':
#  	command => "phpenmod oci8",
#    path    => '/sbin:/bin:/usr/sbin:/usr/bin',
#
#  	}
#
#exec {'symlink sqlplus ':
#      command => "ln -s /usr/local/lib/instantclient_12_2/sqlplus /usr/bin/sqlplus",
#      path    => '/sbin:/bin:/usr/sbin:/usr/bin',
#      unless  => "test -e /usr/bin/sqlplus"
#
#    }

#exec {'add oci8 class oci8_class_connection to php.ini fpm':
#    	command => "cat > /etc/php/7.0/fpm/php.ini « EOF ; configuration for connection OCI8 oci8.connection_class = ${oci8_class_connection}fpm EOF exit",
#      path    => '/sbin:/bin:/usr/sbin:/usr/bin',

#    	}

#exec {'add oci8 class oci8_class_connection to php.ini cli':
#      command => "cat > /etc/php/7.0/cli/php.ini « EOF ; configuration for connection OCI8 oci8.connection_class = ${oci8_class_connection}cli EOF exit",
#      path    => '/sbin:/bin:/usr/sbin:/usr/bin',
#     }

#file_line { 'fpm':
#        path => '/etc/php/7.0/cli/php.ini',
#        line => "oci8.connection_class = ${oci8_class_connection}fpm",
#         }

#file_line { 'add oci8 class connection fpm' :
#     path => "/etc/php/7.0/fpm/php.ini",
#     line => "oci8.connection_class = ${oci8_class_connection}fpm"
#    }

#file_line { 'add oci8 class connection cli' :
#    path => "/etc/php/7.0/cli/php.ini",
#    line => "oci8.connection_class = ${oci8_class_connection}cli",
#
#    }

file_line { 'add LD_LIBRARY_PATH /etc/environment' :
    path => "/etc/environment",
    line => "LD_LIBRARY_PATH=\"/usr/local/lib/instantclient_12_2\"",
    }
file_line { 'add ORACLE_BASE /etc/environment' :
    path => "/etc/environment",
    line =>  "ORACLE_BASE=\"/usr/local/lib/instantclient_12_2\"",
    }
file_line { 'add TNS_ADMIN /etc/environment' :
    path => "/etc/environment",
    line => "TNS_ADMIN=\"/usr/local/lib/instantclient_12_2\"",
    }
file_line { 'add ORACLE HOME /etc/environment' :
    path => "/etc/environment",
    line => "ORACLE_HOME=\"/usr/local/lib/instantclient_12_2\"",
    }

}
