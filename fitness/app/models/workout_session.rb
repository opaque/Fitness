class WorkoutSession < ActiveRecord::Base
  belongs_to :exercise
  belongs_to :event
  has_one :workout_history
  belongs_to :user
end
