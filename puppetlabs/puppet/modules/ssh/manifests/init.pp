class ssh {
  include stages
  class { 'ssh::package':
    stage => first,
  }
  class { 'ssh::config':
    stage => first,
    require => Class['ssh::package']
  }
  class { 'ssh::service': }
}
