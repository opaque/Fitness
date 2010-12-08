class Exercise < ActiveRecord::Base
  has_many :workout_sessions
  
  validates_presence_of :name, :exercise_type
  validates_inclusion_of :exercise_type, :in => [ 'bicep', 'tricep', 'chest', 'quadraceps', 'calves', 'cardio', 'latissimus dorsi', 'shoulders']
  validates_uniqueness_of :name, :scope => :exercise_type
  
end
