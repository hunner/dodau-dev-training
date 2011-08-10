Facter.add("has_foo") do
  setcode "/bin/echo foo"
end

Facter.add("really_has_foo") do
  confine :has_foo => Facter.value(:has_foo)
  setcode 'echo its alive'
end
