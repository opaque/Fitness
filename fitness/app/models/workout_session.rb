class WorkoutSession < ActiveRecord::Base
  belongs_to: exercises
  belongs_to: events
  has_one: workout_history
  belongs_to: user
end
