Usermanagement::User {
  group => 'users',
}
usermanagement::user { 'hunner':
  ensure => present,
}
usermanagement::user { 'elvis':
  ensure => present,
}
usermanagement::user { 'batesn':
  ensure  => present,
  homedir => '/tmp/null',
}
