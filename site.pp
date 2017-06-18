include ::apt
include ::vim
include ::terminal
include ::atom
include ::google_chrome
include ::jdk_oracle
class{'netbeans':
  require => Class['jdk_oracle']
}
include ::pulse
class { 'python' :
  version    => 'system',
  pip        => 'present',
  dev        => 'absent',
  virtualenv => 'absent',
  gunicorn   => 'absent',
}
include ::docker
include ::docker_compose
