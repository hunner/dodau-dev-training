#$env = 'testing'
$packages = hiera_hash("packages")
$classes = hiera_array("classes")

#notify { "packages":
#  message => $packages,
#}

create_resources('package', $packages)

notify { "classes to include":
  message => "${classes}",
}
