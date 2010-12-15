		
Feature: User login

	As a user
	I can navigate to the graph page
	And view the graph of my data 
	
	@wip
	Scenario: User views graph
		Given I am the registered user "user1" with password "password"
			And I am on the login page
		When I login with "user1" and "password"
		Then I should be on the landing page
		When I follow "Graph"
		Then I should be on the graph page
			And I should see 1 image
		
				
	
