# == Class: awesant
#
# Module to manage Awesant log shipper with Puppet.
#
# === Parameters
#
#
# [*package_name*]
#   package name of the Awesant package
#
# [*package_ensure*]
#   package ensure of Awesant package
#   Default: present
#
# === Examples
#
#  class { 'awesant':
#  }
#
# === Authors
#
# Jonas Genannt <genannt@debian.org>
#
# === Copyright
#
# Copyright 2015 Jonas Genannt
#
class awesant(
  $package_name    = $awesant::params::package_name,
  $package_ensure  = $awesant::params::package_ensure,
  $service_name    = $awesant::params::service_name,
  $service_ensure  = $awesant::params::service_ensure,
  $awesant_config  = $awesant::params::awesant_config,
  $awesant_logfile = $awesant::params::awesant_logfile,
  $log_level       = $awesant::params::log_level,
  $input_include   = $awesant::params::input_include,
  $output_include  = $awesant::params::output_include,
  $resources_hiera = $awesant::params::resources_hiera
) inherits awesant::params {

  class { 'awesant::package':
  }->
  class { 'awesant::config':
  }~>
  class { 'awesant::service':
  }

  if ($resources_hiera == true) {
    create_resources('awesant::input::file', hiera('awesant::input::file', {}))

    create_resources('awesant::output::rabbitmq', hiera('awesant::output::rabbitmq', {}))
  }


}
