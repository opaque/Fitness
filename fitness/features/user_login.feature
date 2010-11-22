		
Feature: User login

	As a user
	I can input my profile data
	So that I can view it later
	
	Scenario: User inputs data into profile
		Given I am the registered user user1
			And I am on the login page
		When I login with valid credentials
		Then I should be on the landing page
		
				
	
