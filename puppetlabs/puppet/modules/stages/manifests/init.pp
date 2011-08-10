# Divide `class ssh` into `ssh::package`, `ssh::config`, and `ssh::service`
# Bullet point two where it says "two parameterized classes" should say "three classes"
# Put `ssh::package` in stage first and config/service in stage main (implicitly)

class stages {
  stage { 'first': before => Stage['main'], }
}
