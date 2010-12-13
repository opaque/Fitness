require 'spec_helper'

describe WorkoutSession do
  before(:each) do
    @valid_attributes = {
      :estimated_reps => 10,
	  :estimated_sets => 5,
	  :estimated_mins => 5,
	  :event_id => 1,
	  :exercise_id => 1
    }
  end

  it "should create a new instance given valid attributes" do
    WorkoutSession.create!(@valid_attributes)
  end
end
