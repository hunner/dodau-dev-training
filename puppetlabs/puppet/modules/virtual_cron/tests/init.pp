include virtual_cron::other
include virtual_cron
Cron <| hour == '0' |> {
  ensure => absent,
}
Cron <| hour == '0' |> {
  ensure => present,
}
