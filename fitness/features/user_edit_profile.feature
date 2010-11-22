
Feature: User edit profile

	As a user
	I can view and edit my profile data
	So that I can view it later
	
	Scenario: User views correct data in profile
		Given profile 1 exists 
		When I am on the edit profile page for profile 1
		Then "first_name" should be "John"
		  And "last_name" should be "Smith"
		  And "weight" should be "150"
		  And "height" should be "70"
		  And "gender" should be "Male" 

	Scenario: User edits data in profile
		Given profile 1 exists 
		When I am on the edit profile page for profile 1
		  And I fill in "weight" with "145"
		  And I press "Update"
		Then I should see "Profile was successfully updated."
