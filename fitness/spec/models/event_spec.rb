require 'spec_helper'

describe Event do
  before(:each) do
    user = User.new
    @valid_attributes = {
      :starttime  => DateTime.now,
      :endtime=> DateTime.now >> 1,
      :title => "value for name",
      :description => "something",
      :event_type => "value for event_type",
      :user_id => 5
    }
    
    @recurring_event = {
      :starttime  => Time.now,
      :endtime=> Time.now,
      :title => "value for name",
      :description => "something",
      :event_type => "value for event_type",
      :user_id => 5,
      :period => "monthly"
    }
    
    @valid_workout = {
      :estimated_reps => 5,
      :estimated_sets => 5,
  	  :estimated_weight => 15,
  	  :event_id => 5,
  	  :exercise_id => 5,

  	  :estimated_mins => 10
    }
    
    
  end

  it "should create a new instance given valid attributes" do
    validEvent = Event.create!(@valid_attributes).should be_true
  end
  
  it "should not allow the user to create an event with bad times" do
    @nonvalid_attributes = {
      :starttime=> Time.now,
      :endtime=> Time.now-1,
      :title => "value for name",
      :description => "something",
      :event_type => "value for event_type",
      :user_id => 5
    }
    nonvalid = Event.create(@nonvalid_attributes)
    Event.find(:all).should_not include(nonvalid)
  end
  
  context "testing add_workout_session_and_history" do
    before(:each) do
      @valid = Event.create(@valid_attributes)
      @session = WorkoutSession.new(@valid_workout)
      @session_mock = mock_model(WorkoutSession, :estimate_time => false, :delete =>'hi', :save => true)
      @session_mock.stub(:build).and_return(@session_mock)
    end
    it "should add workout session and history given a valid session" do 
      @history_mock = mock_model(WorkoutHistory, :workout_session_id= => 5, :save => true)
      WorkoutHistory.stub(:new).and_return(@history_mock)
      @valid.stub(:workout_sessions).and_return(@session_mock)
      @history_mock.should_receive(:save) and @session_mock.should_receive(:save)
      @valid.add_workout_session_and_history(@session_mock)
    end
  
    it "should not add workout session or history given a valid session but invalid history" do
      @history_mock = mock_model(WorkoutHistory, :workout_session_id= => 5, :save => false)
      WorkoutHistory.stub(:new).and_return(@history_mock)
      @valid.stub(:workout_sessions).and_return(@session_mock)
      @history_mock.should_receive(:save) and @session_mock.should_receive(:save) and @session_mock.should_receive(:destroy)
      @valid.add_workout_session_and_history(@session_mock)
      
      
      
    end
  end
  
  
  
end
