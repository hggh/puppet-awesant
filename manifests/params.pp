# == Class: awesant::params
#
class awesant::params {
  $package_name    = 'awesant'
  $resources_hiera = true
  $package_ensure  = 'present'
  $service_name    = 'awesant-agent'
  $service_ensure  = 'running'
  $awesant_config  = '/etc/awesant/agent.conf'
  $awesant_logfile = '/var/log/awesant/agent.log'
  $log_level       = 'info'
  $input_include   = [ '/etc/awesant/input.d' ]
  $output_include  = [ '/etc/awesant/output.d' ]
}
