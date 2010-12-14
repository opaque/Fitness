require 'spec_helper'

describe WorkoutSession do
  before(:each) do
    @valid_attributes = {
      :estimated_reps => 3,
	  :estimated_sets => 2,
	  :estimated_mins => 1,
	  :event_id => 1,
	  :exercise_id => 1
    }
  end

  it "should create a new instance given valid attributes" do
    WorkoutSession.create!(@valid_attributes)
  end
  
  it "should calculate duration (mins) of exercise given reps & sets" do
	@attrs_without_mins = {
	  :estimated_reps => 3,
	  :estimated_sets => 2,
	  :event_id => 1,
	  :exercise_id => 1
	}
	@workout = WorkoutSession.new(@attrs_without_mins)
	@mins = @workout.estimate_time
	@mins.should == true
	@workout.estimated_mins.should == 1
  end
end
