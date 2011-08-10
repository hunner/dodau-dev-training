class virtual_cron::other {
  @cron { 'echo at midnight other':
    command => '/bin/echo Ding dong, it\'s midnight',
    user    => 'root',
    hour    => '0',
    minute  => '0',
  }
  @cron { 'logrotate at midnight other':
    command => '/usr/sbin/logrotate',
    user    => 'root',
    hour    => '2',
    minute  => '59',
  }
  @cron { 'logrotate at noon other':
    command => '/usr/sbin/logrotate',
    user    => 'root',
    hour    => '12',
    minute  => '0',
  }
}
