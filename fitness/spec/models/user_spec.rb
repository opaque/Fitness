require 'spec_helper'

describe User do

before { login }

  before(:each) do
    @valid_attributes = {
      :login => 'test',
	  :crypted_password => 'passwordfh;alsjdg;lkahsgdlkj',
	  :password_salt => 'passwordfh;alsjdg;lkahsgdlkj',
	  :persistence_token => 'passwordfh;alsjdg;lkahsgdlkj'
    }
  end

  def mock_event(stubs={})
    @mock_event ||= mock_model(Event, {:user_id= => 1}.merge(stubs)) # make the user_id default at 1
  end
  
  def mock_workout_session(stubs={})
    @mock_workout_session ||= mock_model(WorkoutSession, stubs)
  end
  
  def mock_exercise(stubs={})
    @mock_exercise ||= mock_model(Exercise, stubs)
  end
  
  def mock_profile(stubs={})
    @mock_profile ||= mock_model(Profile, stubs)
  end
  
  it "should create a new instance given valid attributes" do
	activate_authlogic
	User.create!(:login => "test", :password => "password", :password_confirmation => "password")
  end
  
  it "should create a pie graph for exercise done: bicep" do
	activate_authlogic
	Event.stub(:find).and_return([mock_event])
	mock_event.stub(:workout_sessions).and_return([mock_workout_session])
	@workout_sess = mock_event.workout_sessions
	@workout_sess.stub(:find).and_return([mock_workout_session])
	mock_workout_session.stub(:exercise_id).and_return("1")
	Exercise.stub(:find).and_return(mock_exercise)
	mock_exercise.stub(:exercise_type).and_return("bicep")

	@user = User.create!(:login => "test", :password => "password", :password_confirmation => "password")
	@user.exercise_pie_graph(@user)
  end
  
  it "should create a pie graph for exercise done: tricep" do
	activate_authlogic
	Event.stub(:find).and_return([mock_event])
	mock_event.stub(:workout_sessions).and_return([mock_workout_session])
	@workout_sess = mock_event.workout_sessions
	@workout_sess.stub(:find).and_return([mock_workout_session])
	mock_workout_session.stub(:exercise_id).and_return("1")
	Exercise.stub(:find).and_return(mock_exercise)
	mock_exercise.stub(:exercise_type).and_return("tricep")

	@user = User.create!(:login => "test", :password => "password", :password_confirmation => "password")
	@user.exercise_pie_graph(@user)
  end
  
  it "should create a pie graph for exercise done: chest" do
	activate_authlogic
	Event.stub(:find).and_return([mock_event])
	mock_event.stub(:workout_sessions).and_return([mock_workout_session])
	@workout_sess = mock_event.workout_sessions
	@workout_sess.stub(:find).and_return([mock_workout_session])
	mock_workout_session.stub(:exercise_id).and_return("1")
	Exercise.stub(:find).and_return(mock_exercise)
	mock_exercise.stub(:exercise_type).and_return("chest")

	@user = User.create!(:login => "test", :password => "password", :password_confirmation => "password")
	@user.exercise_pie_graph(@user)
  end
  
  it "should create a pie graph for exercise done: quadraceps" do
	activate_authlogic
	Event.stub(:find).and_return([mock_event])
	mock_event.stub(:workout_sessions).and_return([mock_workout_session])
	@workout_sess = mock_event.workout_sessions
	@workout_sess.stub(:find).and_return([mock_workout_session])
	mock_workout_session.stub(:exercise_id).and_return("1")
	Exercise.stub(:find).and_return(mock_exercise)
	mock_exercise.stub(:exercise_type).and_return("quadraceps")

	@user = User.create!(:login => "test", :password => "password", :password_confirmation => "password")
	@user.exercise_pie_graph(@user)
  end
  
 it "should create a pie graph for exercise done: calves" do
	activate_authlogic
	Event.stub(:find).and_return([mock_event])
	mock_event.stub(:workout_sessions).and_return([mock_workout_session])
	@workout_sess = mock_event.workout_sessions
	@workout_sess.stub(:find).and_return([mock_workout_session])
	mock_workout_session.stub(:exercise_id).and_return("1")
	Exercise.stub(:find).and_return(mock_exercise)
	mock_exercise.stub(:exercise_type).and_return("calves")

	@user = User.create!(:login => "test", :password => "password", :password_confirmation => "password")
	@user.exercise_pie_graph(@user)
  end 
  
  it "should create a pie graph for exercise done: cardio" do
	activate_authlogic
	Event.stub(:find).and_return([mock_event])
	mock_event.stub(:workout_sessions).and_return([mock_workout_session])
	@workout_sess = mock_event.workout_sessions
	@workout_sess.stub(:find).and_return([mock_workout_session])
	mock_workout_session.stub(:exercise_id).and_return("1")
	Exercise.stub(:find).and_return(mock_exercise)
	mock_exercise.stub(:exercise_type).and_return("cardio")

	@user = User.create!(:login => "test", :password => "password", :password_confirmation => "password")
	@user.exercise_pie_graph(@user)
  end

  it "should create a pie graph for exercise done: shoulders" do
	activate_authlogic
	Event.stub(:find).and_return([mock_event])
	mock_event.stub(:workout_sessions).and_return([mock_workout_session])
	@workout_sess = mock_event.workout_sessions
	@workout_sess.stub(:find).and_return([mock_workout_session])
	mock_workout_session.stub(:exercise_id).and_return("1")
	Exercise.stub(:find).and_return(mock_exercise)
	mock_exercise.stub(:exercise_type).and_return("shoulders")

	@user = User.create!(:login => "test", :password => "password", :password_confirmation => "password")
	@user.exercise_pie_graph(@user)
  end

  it "should create a pie graph for exercise done: back" do
	activate_authlogic
	Event.stub(:find).and_return([mock_event])
	mock_event.stub(:workout_sessions).and_return([mock_workout_session])
	@workout_sess = mock_event.workout_sessions
	@workout_sess.stub(:find).and_return([mock_workout_session])
	mock_workout_session.stub(:exercise_id).and_return("1")
	Exercise.stub(:find).and_return(mock_exercise)
	mock_exercise.stub(:exercise_type).and_return("back")

	@user = User.create!(:login => "test", :password => "password", :password_confirmation => "password")
	@user.exercise_pie_graph(@user)
  end
  
  it "should create a pie graph for exercise done: calisthenics" do
	activate_authlogic
	Event.stub(:find).and_return([mock_event])
	mock_event.stub(:workout_sessions).and_return([mock_workout_session])
	@workout_sess = mock_event.workout_sessions
	@workout_sess.stub(:find).and_return([mock_workout_session])
	mock_workout_session.stub(:exercise_id).and_return("1")
	Exercise.stub(:find).and_return(mock_exercise)
	mock_exercise.stub(:exercise_type).and_return("calisthenics")

	@user = User.create!(:login => "test", :password => "password", :password_confirmation => "password")
	@user.exercise_pie_graph(@user)
  end
  
  it "should create a pie graph for exercise done: abdominal" do
	activate_authlogic
	Event.stub(:find).and_return([mock_event])
	mock_event.stub(:workout_sessions).and_return([mock_workout_session])
	@workout_sess = mock_event.workout_sessions
	@workout_sess.stub(:find).and_return([mock_workout_session])
	mock_workout_session.stub(:exercise_id).and_return("1")
	Exercise.stub(:find).and_return(mock_exercise)
	mock_exercise.stub(:exercise_type).and_return("abdominal")

	@user = User.create!(:login => "test", :password => "password", :password_confirmation => "password")
	@user.exercise_pie_graph(@user)
  end
  
  it "should create a pie graph for exercise done: random" do
	activate_authlogic
	Event.stub(:find).and_return([mock_event])
	mock_event.stub(:workout_sessions).and_return([mock_workout_session])
	@workout_sess = mock_event.workout_sessions
	@workout_sess.stub(:find).and_return([mock_workout_session])
	mock_workout_session.stub(:exercise_id).and_return("1")
	Exercise.stub(:find).and_return(mock_exercise)
	mock_exercise.stub(:exercise_type).and_return("random")

	@user = User.create!(:login => "test", :password => "password", :password_confirmation => "password")
	@user.exercise_pie_graph(@user)
  end
  
  it "should create a timeline for pounds lost" do
	activate_authlogic
	Event.stub(:find).and_return([mock_event])
	mock_event.stub(:workout_sessions).and_return([mock_workout_session])
	@workout_sess = mock_event.workout_sessions
	@workout_sess.stub(:find).and_return([mock_workout_session])
	Profile.stub(:find).and_return(mock_profile)
	mock_profile.stub(:weight).and_return("100")
	@user = User.create!(:login => "test", :password => "password", :password_confirmation => "password")
	@user.pounds_graph(@user)
	mock_workout_session.stub(:estimated_mins).and_return("6")
  end
  
  it "should create a METs bar graph for the exercises" do
	activate_authlogic
	
	@user = User.create!(:login => "test", :password => "password", :password_confirmation => "password")
	@user.mets_graph
  end
  
end
