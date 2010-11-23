		
Feature: User login

	As a user
	I can input my profile data
	So that I can view it later
	
	Scenario: Login successful
		Given I am the registered user "user1" with password "password"
			And I am on the login page
		When I login with "user1" and "password"
		Then I should be on the landing page
		
	Scenario: Login unsuccessful
		Given I am the registered user "user2" with password "password"
			And I am on the login page
		When I login with "user2" and "password2"
		Then I should not be logged in
				
	
