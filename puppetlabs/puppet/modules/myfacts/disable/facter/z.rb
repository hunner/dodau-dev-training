require 'facter'
ENV.each do |k,v|
  Facter.add(k) do
    setcode do
      "foo fail"
    end
  end
end
