class motd {
  file { '/etc/motd':
    owner   => 'root',
    group   => 'root',
    ensure  => present,
    content => template('motd/motd.erb'),
    mode    => '0644',
  }
}
