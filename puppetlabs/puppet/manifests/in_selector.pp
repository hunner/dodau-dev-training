file { '/tmp/os':
  content => $operatingsystem ? {
    'CENTOS'  => "No copyright or trademark logos here!\n",
    'RHEL'    => "Pay us money for free software with our logo!\n",
    'SOLARIS' => "Shoot for the stars and maybe hit the moon.\n",
    'GENTOO'  => "Ricer.\n",
    default   => "I wanna be an astronaut when I grow up.\n",
  },
}
