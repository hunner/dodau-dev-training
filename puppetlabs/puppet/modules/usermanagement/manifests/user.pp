define usermanagement::user (
  $ensure,
  $group = 'users',
  $homedir = 'default'
) {
  if $name == 'root' {
    fail('This module does not manage root.')
  }
  if $homedir == 'default' {
    $homedir_real = "/home/${name}"
  } else {
    $homedir_real = $homedir
  }
  user { $name:
    ensure => $ensure,
    gid    => $groups,
    home   => $homedir_real,
  }

  if $ensure != 'absent' {
    if ! defined(Group[$group]) {
      group { $group:
        ensure => present,
      }
    }
    file { $homedir_real:
      ensure => present,
      owner  => $name,
      group  => $group,
      mode   => '0711',
    }
  }
}
