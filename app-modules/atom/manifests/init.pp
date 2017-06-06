# Class: atom
# ===========================
#
# Full description of class atom here.
#
# Parameters
# ----------
#
# Document parameters here.
#
# * `sample parameter`
# Explanation of what this parameter affects and what it defaults to.
# e.g. "Specify one or more upstream ntp servers as an array."
#
# Variables
# ----------
#
# Here you should define a list of variables that this module would require.
#
# * `sample variable`
#  Explanation of how this variable affects the function of this class and if
#  it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#  External Node Classifier as a comma separated list of hostnames." (Note,
#  global variables should be avoided in favor of class parameters as
#  of Puppet 2.6.)
#
# Examples
# --------
#
# @example
#    class { 'atom':
#      servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#    }
#
# Authors
# -------
#
# Author Name <author@domain.com>
#
# Copyright
# ---------
#
# Copyright 2017 Your name here, unless otherwise noted.
#
#------------------------------------------------------
# da /edestecd-software-1.1.0/manifests/editors/
#    'Ubuntu': {
#      validate_string($url)
#      $apm_require = Package['atom']
#      $apt_ppa_ensure = $ensure ? {
#        'installed' => present,
#        'latest'    => present,
#        default     => $ensure,
#      }
#
#      include '::apt'
#      apt::ppa { 'ppa:webupd8team/atom':
#        ensure         => $apt_ppa_ensure,
#        package_manage => true,
#      } -> Class['apt::update'] ->
#
#      package { 'atom':
#        ensure => $ensure,
#      }
#
class atom { 
  apt::ppa { 'ppa:webupd8team/atom': }
  package {'atom':
     ensure => 'installed',
     require => Apt::Ppa['ppa:webupd8team/atom'],
  }    
}

