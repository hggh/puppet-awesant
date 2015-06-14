# == Class: awesant::config
#
class awesant::config {

  $awesant_config  = $awesant::awesant_config
  $awesant_logfile = $awesant::awesant_logfile
  $log_level       = $awesant::log_level
  $input_include   = $awesant::input_include
  $output_include  = $awesant::output_include

  file { $awesant_config:
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0755',
    content => template('awesant/agent.conf.erb'),
    require => Class['awesant::package'],
    notify  => Class['awesant::service'],
  }

  file { '/etc/awesant/input.d':
    ensure  => directory,
    owner   => 'root',
    group   => 'root',
    mode    => '0755',
    purge   => true,
    force   => true,
    recurse => true,
    require => Class['awesant::package'],
    notify  => Class['awesant::service'],
  }

  file { '/etc/awesant/output.d':
    ensure  => directory,
    owner   => 'root',
    group   => 'root',
    mode    => '0755',
    purge   => true,
    force   => true,
    recurse => true,
    require => Class['awesant::package'],
    notify  => Class['awesant::service'],
  }



}
