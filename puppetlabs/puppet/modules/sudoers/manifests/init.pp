class sudoers {
  file { '/etc/sudoers':
    source => 'puppet:///modules/sudoers/sudoers',
    owner  => 'root',
    group  => 'root',
    mode   => '0440',
  }
}
