# == Class: ansible
#
# Install ansible
#
class ansible (
  String $package_name = 'ansible',
) {

  package { 'ansible':
    ensure => 'present',
    name   => $package_name,
  }
}
