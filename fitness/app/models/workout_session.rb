class WorkoutSession < ActiveRecord::Base
  belongs_to :exercise
  belongs_to :event
  has_one :workout_history, :dependent => :destroy
  belongs_to :user
  
  validates_presence_of :estimated_mins, :event_id, :exercise_id
  validates_presence_of :estimated_reps, :estimated_sets, :unless => :estimated_mins_present
  
  validates_numericality_of :estimated_mins, :greater_than => 0
  validates_numericality_of :estimated_reps, :allow_nil => true, :greater_than => 0
  validates_numericality_of :estimated_sets, :allow_nil => true, :greater_than => 0
  
  def estimated_mins_present
	not self.estimated_mins.nil?
  end
  
  def estimate_time
	@bool = false
	if self.estimated_mins.nil?
		@reps = self.estimated_reps
		@sets = self.estimated_sets
		if (not @reps.nil?) and (not @sets.nil?)
			self.estimated_mins = ((@reps * 10.0) / 60.0) * @sets
			@bool = true
		end
	end
	
	return @bool
  end
  
end
