require 'spec_helper'

describe WorkoutHistory do
  before(:each) do
    @valid_attributes = {
      :actual_reps => 10,
	  :actual_sets => 10,
	  :actual_mins => 10,
	  :calories => nil,
	  :workout_session_id => 1
    }
	
  end

  it "should create a new instance given valid attributes" do
    WorkoutHistory.create!(@valid_attributes)
  end
  
  it "should create a new instance given nil for actual reps" do
    @valid_attributes[:actual_reps] = nil
	WorkoutHistory.create(@valid_attributes).should be_true
  end
  
  it "should create a new instance given nil for actual sets" do
    @valid_attributes[:actual_sets] = nil
	WorkoutHistory.create(@valid_attributes).should be_true
  end
  
  it "should create a new instance given nil for actual reps" do
    @valid_attributes[:actual_reps] = nil
	WorkoutHistory.create(@valid_attributes).should be_true
  end
  
  
  
  context "when giving invlaid attributes to workout history" do
	
	before(:each) do
	  @invalid_attributes = {
      :actual_reps => 10,
	  :actual_sets => 10,
	  :calories => nil,
	  :workout_session_id => 1
      }
	  
	end
  
	  it "should not create a new instance given non numerical rep values" do
		@invalid_attributes[:actual_reps] = "fun"
		@workout_history = WorkoutHistory.new(@invalid_attributes)
		@workout_history.should_not be_valid	
	  end
	  
	  it "should not create a new instance given non numerical set values" do
		@invalid_attributes[:actual_sets] = "fail set"
		@workout_history = WorkoutHistory.new(@invalid_attributes)
		@workout_history.should_not be_valid	
	  end
	  
	  it "should not create a new instance given non numerical caloric values" do
		@invalid_attributes[:calories] = "fail calories"
		@workout_history = WorkoutHistory.new(@invalid_attributes)
		@workout_history.should_not be_valid	
	  end
	  
	  it "should not create a new instance if a workout history has already been created for specified session" do
		WorkoutHistory.create(@valid_attributes)
		@workout_history = WorkoutHistory.new(@invalid_attributes)
		@workout_history.should_not be_valid	
	  end
	  
	  it "should not create a new instance given null workout session id association" do
		@invalid_attributes.delete(:workout_session_id)
		@workout_history = WorkoutHistory.new(@invalid_attributes)
		@workout_history.should_not be_valid	  
	  end
	  
  
  end
  
  
  
  
end
