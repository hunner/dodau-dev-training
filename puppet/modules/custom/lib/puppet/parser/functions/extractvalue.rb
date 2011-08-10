Puppet::Parser::Functions.newfunction(
    :extractvalue,
    :type => :rvalue,
    :doc => "Doc stub") do |args|
  raise Puppet::ArgumentError unless args.length == 2
  raise Puppet::ArgumentError unless args[0] =~ /^\//
  path, field = args
  emails = YAML.load_file(path)
  emails[field]
end
