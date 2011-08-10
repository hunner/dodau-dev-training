Facter.add("listening_ports") do
  setcode do
    IO.popen("netstat -nlpt").readlines.collect do |line|
      line = line.match(/:(\d+)\s+/)
      line[1].to_i if line
    end.compact.sort.join(',')
  end
end
