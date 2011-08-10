define sudo::line (
  $ensure,
  $password = true,
  $commands = 'ALL',
  $groups   = 'ALL',
  $hosts    = 'ALL',
  $group
) {
  if $group {
    $type = 'group'
  } else {
    $type = 'user'
  }
  file { "${sudo::basedir}/sudoers.d/${type}-${name}":
    ensure  => $ensure,
    content => template("sudo/line.erb"),
    notify  => Exec['rebuild-sudoers'],
  }
}
