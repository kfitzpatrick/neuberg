# Then /^I should see a table row with the cells "([^\"]*)"$/ do |cells|
#   response.should have_tag('table') do |table|
#     cells.split(/\s*,\s*/).each do |cell|
#       table.should have_tag('td', :text => /#{cell}/)
#     end
#   end
# end

Then /^I should see the header "([^\"]*)"$/ do |header|
  Then %(I should see "#{header}" within "h1")
end
