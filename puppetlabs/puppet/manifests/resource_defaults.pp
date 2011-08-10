File {
  owner => 'root',
  group => 'root',
  mode  => '0644',
}
file { '/tmp/defaults':         ensure => directory, }
file { ['/tmp/defaults/hello', '/tmp/defaults/goodbye']:
  ensure => present,
}
