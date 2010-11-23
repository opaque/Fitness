		
Feature: User input profile

	As a user
	I can input my profile data
	So that I can view it later
	
	Scenario: User completes profile
		Given blank profile 1 exists
		When I am on the edit profile page for profile 1
		  And I fill in "profile_first_name" with "John"
		  And I fill in "profile_last_name" with "Smith"
		  And I fill in "weight" with "150"
		  And I fill in "height" with "70"
		  And I select "Male" from "gender"
		  And I press "Update"
		Then I should see "Profile was successfully updated."
	
	Scenario: User partially completes profile
		Given blank profile 1 exists
		When I am on the edit profile page for profile 1
		  And I fill in "profile_first_name" with "John"
		  And I fill in "profile_last_name" with "Smith"
		  And I select "Male" from "gender"
		  And I press "Update"
		Then I should see "Profile was successfully updated."
	
