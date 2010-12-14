
Given /^event (\d+) exists$/ do |arg1|
  @profile = Event.create(:id => arg1, :user_id => arg1, :starttime => "November 25, 2010 10:00", :endtime => "November 25, 2010 11:00", :name => "Daily Exercise", :event_type => "Exercise")
end

And /^workout session (\d+) exists under event (\d+)$/ do |arg1, arg2|
  @workout = WorkoutSession.create(:id => arg1, :event_id => arg2, :exercise_id => 1, :estimated_reps => 10, :estimated_sets => 10, :estimated_mins => 10.0)
  @workout_history = WorkoutHistory.create(:id => arg1, :workout_session_id => arg1, :actual_reps => 0, :actual_sets => 0, :calories => 100)
end


