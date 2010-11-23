		
Feature: User login

	As a user
	I can navigate to the graph page
	And view the graph of my data 
	
	Scenario: User views graph
		Given I am the registered user user1
			And I am on the login page
		When I login with valid credentials
		Then I should be on the landing page
		When I follow "Graph"
		Then I should be on the graph page
			And I should see 1 image
		
				
	
