class virtual_cron {
  @cron { 'echo at midnight':
    command => '/bin/echo Ding dong, it\'s midnight',
    user    => 'root',
    hour    => '0',
    minute  => '0',
  }
  @cron { 'logrotate at midnight':
    command => '/usr/sbin/logrotate',
    user    => 'root',
    hour    => '1',
    minute  => '59',
  }
  @cron { 'logrotate at noon':
    command => '/usr/sbin/logrotate',
    user    => 'root',
    hour    => '12',
    minute  => '0',
  }
}
