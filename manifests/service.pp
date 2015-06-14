# == Class: awesant::service
#
class awesant::service {
  service { $awesant::service_name:
    ensure     => $awesant::service_ensure,
    hasrestart => true,
    hasstatus  => false,
    pattern    => 'awesant.*agent.conf',
  }
}
