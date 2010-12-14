		
Feature: User create workout session

	As a user
	I can navigate to the calendar page
	And create a new event with a workout session
	
	Scenario: User goes to calendar page 
		Given I am the registered user "user1" with password "password"
			And I am on the login page
		When I login with "user1" and "password"
		Then I should be on the landing page
		When I follow "Calendar"
		Then I should be on the calendar page
	
	@wip
	Scenario: User creates a new event
		Given I am the registered user "user1" with password "password"
			And I am on the login page
			And I login with "user1" and "password"
		When I am on the new event page
			And I select "November 25, 2010 10:00" as the "Start at" date and time
			And I select "November 25, 2010 11:00" as the "End at" date and time
			And I fill in "Daily Exercise" for "name"
			And I press "Create"
		Then I should see "Event was successfully created."
		
	@wip
	Scenario: User creates workout session for existing event
		Given I am the registered user "user1" with password "password"
			And I am on the login page
			And I login with "user1" and "password"
			And event 1 exists 
		When I am on the new exercise page for event 1
			And I fill in "20" for "Estimated reps"
			And I fill in "20" for "Estimated sets"
			And I press "Create"
		Then I should see "WorkoutSession was successfully created."

		
				
	
