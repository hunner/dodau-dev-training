Puppet::Parser::Functions.newfunction(:join, :type => :rvalue) do |args|
  raise ArgumentError, "Incorrect arguments; Expects 2 got #{args.length}" if args.length != 2
  args.join(args.pop)
end
