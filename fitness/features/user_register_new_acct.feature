		
Feature: User register new account

	As a user
	I can input new login and password
	So that I can create a new account
	
	Scenario: User registers new account
		Given I am on the register page
		When I fill in "login" with "user1"
		  And I fill in "password" with "password"
		  And I fill in "user_password_confirmation" with "password"
		  And I press "Register"
		Then I will see "Account and profile registered!"
				
	
