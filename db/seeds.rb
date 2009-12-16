# Create the membership levels we know about
['Basic', 'Lite', 'Fulltime'].each do |level_name|
  MembershipLevel.find_or_create_by_name(level_name)
end