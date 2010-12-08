class WorkoutSession < ActiveRecord::Base
  belongs_to :exercise
  belongs_to :event
  has_one :workout_history, :dependent => :destroy
  belongs_to :user
  
  validates_presence_of :estimated_mins, :event_id, :exercise_id, :estimated_reps, :estimated_sets
  #validates_uniqueness_of :exercise_id, :scope => :event_id
  validates_numericality_of :estimated_mins, :greater_than => 0
  validates_numericality_of :estimated_reps, :greater_than => 0
  validates_numericality_of :estimated_sets, :greater_than => 0
  
end
