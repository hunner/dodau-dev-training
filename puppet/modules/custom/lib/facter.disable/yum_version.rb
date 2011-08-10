Facter.add("has_yum") do
  setcode do
    File.exist?('/usr/bin/yum') ? 'true' : 'false'
  end
end

Facter.add("yum_version") do
  confine :has_yum => 'true',
          :operatingsystem => ["centos","fedora","redhat"]
  setcode 'yum --version|head -n 1'
end
