# Class: pulse
# ===========================
#
# Full description of class pulse here.
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
#    class { 'pulse':
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
class pulse (
    $ensure = 'present',
    $url = 'https://antivirus.unibo.it/vpnsoftware/ps-pulse-linux-8.2r5.0-b49363-ubuntu-debian-installer.deb',
  ) {

  if $osfamily == 'Debian' {
    package { 'lib32z1':
      ensure => present,
    }
    package { 'libc6-i386':
      ensure => present,
    }
    package { 'libwebkitgtk-1.0-0:i386':
      ensure => present,
    }

    package { 'libproxy1-plugin-gsettings:i386':
      ensure => present,
    }
    package { 'libproxy1-plugin-webkit:i386':
      ensure => present,
    }
    # package { 'libdconf1:i386':
    #   ensure => present,
    # }
    package { 'dconf-gsettings-backend:i386':
      ensure => present,
    }

    if $ensure == 'present' {
      exec {"download_unibo_pulse_from_${url}":
        command =>"/usr/bin/curl -o /tmp/pulse.deb ${url}",
      }
      exec {"install_pulse":
      command =>"/usr/bin/dpkg --install /tmp/pulse.deb",
      }
    }
  }

}
