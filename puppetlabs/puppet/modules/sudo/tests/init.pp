include sudo
sudo::user { 'hunner':
  ensure   => present,
  password => false,
}

sudo::user { 'elvis':
  ensure   => present,
  password => true,
  hosts    => 'devbox',
  commands => '/bin/cat',
}
sudo::group { 'users':
  ensure   => present,
  commands => '/bin/echo',
}

