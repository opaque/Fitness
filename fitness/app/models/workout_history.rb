class WorkoutHistory < ActiveRecord::Base
  belongs_to :workout_session
  
  validates_presence_of :workout_session_id
  validates_uniqueness_of :workout_session_id
  validates_numericality_of :actual_reps, :allow_nil => true, :greater_than => -1
  validates_numericality_of :actual_sets, :allow_nil => true, :greater_than => 0
  validates_numericality_of :actual_mins, :allow_nil => true
  
  validates_numericality_of :calories, :allow_nil => true, :greater_than => 0
  
  
end
