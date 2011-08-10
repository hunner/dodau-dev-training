class ssh::service {
  service { 'sshd':
    ensure     => 'running',
    enable     => 'true',
    hasstatus  => 'true',
    hasrestart => 'true',
    subscribe  => File['/etc/ssh/sshd_config'],
  }
}
