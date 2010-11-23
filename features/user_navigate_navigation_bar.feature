		
Feature: User navigates using navigation bar

	As a user
	I can click links in the navigation bar
	So that I can go to different pages of my account
	
	Scenario: User goes to graph page
		Given I am the registered user "user1" with password "password"
			And I am on the login page
		When I login with "user1" and "password"
		Then I should be on the landing page
		When I follow "Graph"
		Then I should be on the graph page
				
	Scenario: User goes to calendar page
		Given I am the registered user "user1" with password "password"
			And I am on the login page
		When I login with "user1" and "password"
		Then I should be on the landing page
		When I follow "Calendar"
		Then I should be on the calendar page
		
	Scenario: User goes to profile page
		Given I am the registered user "user1" with password "password"
			And I am on the login page
		When I login with "user1" and "password"
		Then I should be on the landing page
		When profile 1 exists
			And I follow "My Profile"
		Then I should be on the edit profile page for profile 1
		
	Scenario: User goes to home page
		Given I am the registered user "user1" with password "password"
			And I am on the login page
		When I login with "user1" and "password"
		Then I should be on the landing page
		When I follow "Home"
		Then I should be on the landing page
