class motd {
  file { '/etc/motd':
    ensure  => present,
    content => template('motd/motd.erb'),
    mode    => '0644',
  }
}
