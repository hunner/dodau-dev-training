resources { 'host':
  purge => true,
}
Host {
  ensure => 'present',
  target => '/etc/hosts',
}

host { 'localhost.localdomain':
  ip           => '127.0.0.1',
  host_aliases => ['localhost', 'puppet', 'puppet.localdomain'],
}

host { 'localhost6.localdomain6':
  ip           => '::1',
  host_aliases => ['localhost6'],
}
