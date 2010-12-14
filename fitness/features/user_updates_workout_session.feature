		
Feature: User update workout session

	As a user
	I can navigate to the calendar page
	And create a new event with a workout session
	
	Scenario: User views existing workout session
		Given I am the registered user "user1" with password "password"
			And I am on the login page
		When I login with "user1" and "password"
			And event 1 exists
			And workout session 1 exists under event 1
		When I am on the edit workout page for workout session 1 of event 1
		Then "Estimated reps" should be "10"
			And "Estimated sets" should be "10"
			
	Scenario: User edits "expected" workout data
		Given I am the registered user "user1" with password "password"
			And I am on the login page
		When I login with "user1" and "password"
			And event 1 exists
			And workout session 1 exists under event 1
		When I am on the edit workout page for workout session 1 of event 1
			And I fill in "Estimated reps" with "20"
		Then I will see "WorkoutSession was successfully updated."
		
	

		
				
	
