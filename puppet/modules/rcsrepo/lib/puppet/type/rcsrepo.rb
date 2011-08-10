Puppet::Type.newtype(:rcsrepo) do
  desc "This is a type to manage a revision control repository"

  ensurable
  newproperty(:revision) do
    desc "The revision which should be checked out"
    newvalues(/^\S+$/)
  end
  newparam(:path, :namevar => true) do
    desc "The location to store the repo"
    validate do |value|
      raise ArgumentError, "Path is not an absolute path: #{value}" unless value =~ /^\//
    end
  end
  newparam(:source) do
    desc "The source URI for the repo"
    validate do |value|
      raise ArgumentError, "Source is not a http(s) or git URL: #{value}" unless value =~ /^(https?|git|svn):\/\//
    end
    munge do |value|
      resource[:provider] = :git if value =~ /^git:\/\//
      resource[:provider] = :svn if value =~ /^svn:\/\//
      value
    end
  end
end
