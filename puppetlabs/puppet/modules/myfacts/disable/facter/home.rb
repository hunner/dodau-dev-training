require 'facter'
ENV.each do |k,v|
  Facter.add(k) do
    setcode do
      v
    end
  end
end
