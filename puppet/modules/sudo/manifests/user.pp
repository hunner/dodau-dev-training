define sudo::user (
  $ensure,
  $password = true,
  $commands = 'ALL',
  $groups   = 'ALL',
  $hosts    = 'ALL'
) {
  sudo::line { $name:
    ensure   => $ensure,
    password => $password,
    commands => $commands,
    groups   => $groups,
    hosts    => $hosts,
    group    => false,
  }
}
