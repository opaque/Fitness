require 'spec_helper'

describe WorkoutHistory do
  before(:each) do
    @valid_attributes = {
      :actual_reps = 10,
	  :actual_sets = 10,
	  :calories = nil,
	  :workout_session_id = 1
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
      :actual_reps = 10,
	  :actual_sets = 10,
	  :calories = nil,
	  :workout_session_id = 1
      }
	  
	end
  
	  it "should not create a new instance given non numerical rep values" do
		@invalid_attributes[:actual_reps] = "fun",
		WorkoutHistory.create(@invalid_attributes).should be_false
	  end
	  
	  it "should not create a new instance given non numerical set values" do
		@invalid_attributes[:actual_sets] = "fail set"
		WorkoutHistory.create(@invalid_attributes).should be_false
	  end
	  
	  it "should not create a new instance given non numerical caloric values" do
		@invalid_attributes[:calories] = "fail calories"
		WorkoutHistory.create(@invalid_attributes).should be_false
	  end
	  
	  it "should not create a new instance if a workout history has already been created for specified session" do
		WorkoutHistory.create(@valid_attributes)
		WorkoutHistory.create(@invalid_attributes).should be_false
	  end
	  
	  it "should not create a new instance given null workout session id association" do
		@invalid_attributes.delete(:workout_session_id)
		WorkoutHistory.create(@invalid_attributes).should be_false
	  end
	  
  
  end
  
  
  
  
end
