# == Define: awesant::input::file
#
define awesant::input::file (
  $type,
  $path,
  $skip            = [],
  $add_field       = [],
  $format          = 'plain',
  $ensure          = 'present',
  $oldlogstashjson = 'no'
) {
  validate_string($type)
  # FIXME: entweder array oder string: $path
  # FIXME $format: plain,json

  file { "/etc/awesant/input.d/file_${name}.conf":
    ensure  => $ensure,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template('awesant/input/file.conf.erb'),
    require => Class['awesant::config'],
    notify  => Class['awesant::service'],
  }
}
