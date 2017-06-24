# == Class: oci8::params
#
# Defines default values for puppetboard parameters.
#
# Inherited by Class['oci8'].
#
class oci8::params {
  $packages = [ 'libaio1',]


$oracle_instantclient_path = '/usr/local/lib/instantclient_12_2'
$oci8_class_connection = $facts['networking']['hostname']

}
