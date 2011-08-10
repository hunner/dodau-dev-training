node default {
  notify { "${hostname} has no node definition.": }
}

node first, second {
  include motd
  $user = 'hunter'
  $email = extractvalue('/tmp/emails.yaml',$user)
  #notify { "email extraction":
  #  message => "${user} is ${email}",
  #}
}
