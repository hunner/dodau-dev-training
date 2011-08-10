class exec {
  exec { "/bin/touch /tmp/foo":
    creates => '/tmp/foo',
  }

  file { "/tmp/foo":
    ensure => absent,
  }
}
