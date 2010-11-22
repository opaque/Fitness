class WorkoutHistory < ActiveRecord::Base
  belongs_to :workout_session
  has_one :event, :through => :workout_session
end
