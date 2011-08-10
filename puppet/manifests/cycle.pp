notify { "one":
  require => Notify['two'],
}

notify { "two":
  require => Notify['one'],
}
