class bluetooth ($disable = false) {
  $enable = ! $disable
  if $disable {
    Service['hidd'] -> Package['bluez-utils'] -> Package['bluez-libs']
    $packages = 'absent'
    $service = 'stopped'
  } else {
    Service['hidd'] <- Package['bluez-utils'] <- Package['bluez-libs']
    $packages = 'present'
    $service = 'running'
  }

  package { ['bluez-libs', 'bluez-utils']:
    ensure => $packages,
  }

  service { 'hidd':
    ensure     => $service,
    enable     => $enable,
    status     => '. /etc/init.d/functions && status hidd',
    hasstatus  => true,
    hasrestart => true,
  }
}
