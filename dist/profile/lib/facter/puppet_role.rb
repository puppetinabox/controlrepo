# ((a-z]+)-([a-z]+)[0-9]*, i.e. dur-www01 or chi-logger have a puppet_role of www or logger
Facter.add(:puppet_role) do
  confine :hostname do |value|
    value =~ /^([a-z]+)-([a-z]+)[0-9]*$/
  end

  setcode { Facter.value(:hostname)[/^([a-z]+)-([a-z]+)[0-9]*$/, 2] }
end

# ([a-z]+)[0-9]*, i.e. www01 or logger have a puppet_role of www or logger
Facter.add(:puppet_role) do
  confine :hostname do |value|
    value =~ /^([a-z]+)[0-9]*$/
  end

  setcode { Facter.value(:hostname)[/^([a-z]+)[0-9]*$/, 1] }
end

# Set to 'default' if no patterns match
Facter.add(:puppet_role) do
  setcode { 'default'}
end
