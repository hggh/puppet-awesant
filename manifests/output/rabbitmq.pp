# == Define: awesant::output::rabbitmq
#
define awesant::output::rabbitmq (
  $type,
  $host                 = '127.0.0.1',
  $port                 = 5672,
  $timeout              = 10,
  $user                 = 'guest',
  $password             = 'guest',
  $queue                = 'logstash',
  $exchane              = 'logstash',
  $queue_durable        = false,
  $queue_exclusive      = false,
  $queue_auto_delete    = false,
  $exchange_durable     = false,
  $exchange_auto_delete = false,
  $channel              = 1,
  $vhost                = '/',
  $ensure               = 'present'
) {

  file { "/etc/awesant/output.d/rabbit_${name}.conf":
    ensure  => $ensure,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template('awesant/output/rabbitmq.conf.erb'),
    require => Class['awesant::config'],
    notify  => Class['awesant::service'],
  }
}
