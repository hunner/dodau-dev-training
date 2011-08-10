#authorized_key for a user can be an empty file for this example
#/etc/puppetlabs/puppet/files/vim contents can be cp'd from ~root/src/puppet/ext/vim
#/etc/puppetlabs/puppet/files/vimrc can come from ~root/.vimrc

#$username = 'root'
$username = 'elvis'
$homedir = $username ? {
  'root'  => '/root',
  default => "/home/${username}",
}
$sourcepath = '/etc/puppetlabs/puppet/files'

File {
  owner => $username,
  group => $username,
  mode  => '0644',
}

file { $homedir:
  ensure => directory,
  mode   => '0711',
}

file { "${homedir}/.vimrc":
  source => "${sourcepath}/vimrc"
}

file { "${homedir}/.vim":
  source  => "${sourcepath}/vim",
  recurse => true,
}

file { "${homedir}/.ssh":
  ensure => directory,
  mode   => '0700',
}

case $username {
  'root': {
    #file { "${homedir}/.ssh/authorized_keys":
    #  ensure => absent,
    #}
    notify { "${homedir}/.ssh/authorized_keys":
      message => "Would have ensured absent",
    }
  }
  default: {
    #file { "${homedir}/.ssh/authorized_keys":
    #  ensure => present,
    #  source => "${sourcepath}/authorized_keys.${username}",
    #}
    ssh_authorized_key { "${username}'s authorized_key":
      user => $username,
      type => 'ssh-rsa',
      key  => 'AAAAB3NzaC1yc2EAAAABIwAAAQEAtF50sUYXXNQ24PvI0YD3Sd2PxvlVd+AE8paE8QhdJ67XhIAEhOxbMF1qxBkbvrT8kXTBA36qC6OkwDnE2z3muQKzL0URAm5soqd9vxCvhlhxlqx6ch6SnJP6PmOchP5dPfc5af6WQOdbO4boJcCARE0pNphORUpLyxd8U6IDPEaS3DdFKZAptOr5RYbxJv977rCaGEHDyEelzW2+2GIlfwD2yEeT21WLDhbhQx+LvrKpYyKFEPeibD0LKMDW4vZAWR67aSCBC31ByrZZlcJjPRTB6+T6sFtrHVow8UesluYs49o9dtUCrwL9Ep4qYnCW9PQ3N0NSSSFFUpPTIktexw==',
    }
  }
}
