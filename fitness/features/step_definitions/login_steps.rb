
Given /^I am the registered user (.+)$/ do |login|
  params = {
    "login"=> login,
    "password"=>"password",
    "password_confirmation"=>"password"
  }
  @user = User.create(params)
end

When /^I login with valid credentials$/ do
  fill_in('Login', :with => @user.login)
  fill_in('Password', :with => "password")
  click_button("Login")
end



