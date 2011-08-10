class virtual_users {
  @user { 'hunner': groups => ['dba','wheel','dev'], }
  @user { 'elvis': groups => ['dba','dev'], }
  @user { 'batesn': groups => ['dba'], }
  @user { 'spaz': groups => ['dev','wheel'], }
}

class dba_users {
  include virtual_users
  User <| groups == 'dba' |>
}
class dev_users {
  include virtual_users
  User <| groups == 'dev' |>
}
class wheel_users {
  include virtual_users
  User <| groups == 'wheel' |>
}

class users {
  include wheel_users
  include dev_users
  include dba_users
}
