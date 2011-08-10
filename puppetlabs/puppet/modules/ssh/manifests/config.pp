class ssh::config {
  file { '/etc/ssh/sshd_config':
    source  => 'puppet:///modules/ssh/sshd_config',
    owner   => 'root',
    group   => 'root',
    mode    => '0600',
    require => Package['openssh-server'],
  }
}
