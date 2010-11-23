
Given /^I am the registered user "([^"]*)" with password "([^"]*)"$/ do |login,password|
  params = {
    "login"=> login,
    "password"=>password,
    "password_confirmation"=>password
  }
  @user = User.create(params)
end

When /^I login with "([^"]*)" and "([^"]*)"$/ do |login,password|
  fill_in('Login', :with => login)
  fill_in('Password', :with => password)
  click_button("Login")
end

Then /^I should not be logged in$/ do
  @current_user == nil
end

