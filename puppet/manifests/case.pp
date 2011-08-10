case $operatingsystem {
  'CENTOS': {$content = "No copyright or trademark logos here!\n"}
  'RHEL':   {$content = "Pay us money for free software with our logo!\n"}
  'SOLARIS':{$content = "Shoot for the stars and maybe hit the moon.\n"}
  'GENTOO': {$content = "Ricer.\n"}
  default:  {$content = "I wanna be an astronaut when I grow up.\n"}
}

file { '/tmp/os':
  content => $content,
}
