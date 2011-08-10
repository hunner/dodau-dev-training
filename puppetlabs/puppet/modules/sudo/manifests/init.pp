class sudo {
  $basedir = '/tmp'
  File {
    owner => 'root',
    group => 'root',
    mode  => '0440',
  }
  file { "${basedir}/sudoers.d":
    ensure  => directory,
    source  => 'puppet:///modules/sudo/sudoers.d',
    purge   => true,
    recurse => true,
  }
  exec { 'rebuild-sudoers':
    command     => "/bin/cat ${basedir}/sudoers.d/* > ${basedir}/sudoers",
    refreshonly => true,
    subscribe   => File["${basedir}/sudoers.d"],
  }
  file { "${basedir}/sudoers":
    require => Exec['rebuild-sudoers'],
    before  => Exec['validate sudoers'],
  }
  exec { 'validate sudoers':
    command => "visudo -c -f ${basedir}/sudoers",
    path    => ['/usr/sbin', '/usr/bin'],
    unless  => "diff ${basedir}/sudoers /etc/sudoers",
  }
  file { '/etc/sudoers':
    source  => "${basedir}/sudoers",
    require => Exec['validate sudoers'],
  }
}
