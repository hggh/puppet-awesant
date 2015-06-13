# == Class: awesant::package
#
class awesant::package {
  package { $awesant::package_name:
    ensure => $awesant::package_ensure,
  }
}
