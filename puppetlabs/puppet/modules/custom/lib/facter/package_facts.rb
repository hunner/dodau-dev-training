IO.popen("yum list installed").readlines.each do |line|
  m = line.match(/^([\w\d]+)(\.noarch|\.i386|\.x86_64)\s+([\d\.\-a-z:]+)/)
  next unless m
  package = m[1]
  version = m[3]
  Facter.add("yum_#{package}_version") do
    confine :has_yum => 'true'
    confine :operatingsystem => ["centos","redhat","fedora"]
    setcode do
      version
    end
  end
end
