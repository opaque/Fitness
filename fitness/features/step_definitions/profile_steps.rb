
Given /^profile (\d+) exists$/ do |arg1|
  @profile = Profile.create(:id => arg1, :user_id => arg1, :first_name => "John", :last_name => "Smith", :height => 70, :weight => 150, :gender => "Male")
end

Given /^blank profile (\d+) exists$/ do |arg1|
  @profile = Profile.create(:id => arg1, :user_id => arg1, :first_name => "", :last_name => "", :height => nil, :weight => nil, :gender => nil)
end

Then /^"([^"]*)" should be "([^"]*)"$/ do |arg1, arg2|
  @profile[arg1] == arg2
end