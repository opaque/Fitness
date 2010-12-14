require 'spec_helper'

describe WorkoutHistoriesController do

  before(:each) do
	login
	Event.stub(:find).with(:first, :conditions => ['id = ?', "1"]).and_return(mock_event)
	WorkoutSession.stub(:find).with("2").and_return(mock_workout_session)
	mock_workout_session.stub(:event_id).and_return("1")
	mock_workout_session.stub(:workout_history).and_return(mock_workout_history)
	mock_workout_session.stub(:workout_histories).and_return(mock_workout_history)
	mock_workout_history.stub(:build).and_return(mock_workout_history)
	WorkoutHistory.stub(:find).with("37").and_return(mock_workout_history)
	mock_workout_history.stub(:build).with({'these' => 'params'}).and_return(mock_workout_history(:save => true))
  end
  
	def mock_workout_session(stubs={})
		@mock_workout_session ||= mock_model(WorkoutSession, stubs)
	end

	def mock_event(stubs={})
		@mock_event ||= mock_model(Event, {:user_id= => 1}.merge(stubs)) # make the user_id default at 1
	end
	  
	def mock_workout_history(stubs={})
		@mock_workout_history ||= mock_model(WorkoutHistory, stubs)
	end
	  
	  

  describe "GET index" do
    it "assigns all workout_histories as @workout_histories" do
	  WorkoutSession.stub(:find).and_return(mock_workout_session)
	  Event.stub(:find).and_return([mock_event])
	  mock_workout_session.stub(:workout_history).and_return([mock_workout_history])
      get :index, :workout_session_id => "2"
      assigns[:workout_histories].should == [mock_workout_history]
    end
  end

  describe "GET show" do
    it "assigns the requested workout_history as @workout_history" do
      WorkoutSession.stub(:find).and_return(mock_workout_session)
	  Event.stub(:find).and_return([mock_event])
      get :show, :workout_session_id => "2", :id => "37"
      assigns[:workout_history].should equal(mock_workout_history)
    end
  end

  describe "GET new" do
    it "assigns a new workout_history as @workout_history" do
      WorkoutSession.stub(:find).and_return(mock_workout_session)
	  Event.stub(:find).and_return([mock_event])
      get :new, :workout_session_id => "2"
      assigns[:workout_history].should equal(mock_workout_history)
    end
  end

  describe "GET edit" do
    it "assigns the requested workout_history as @workout_history" do
      WorkoutSession.stub(:find).and_return(mock_workout_session)
	  Event.stub(:find).and_return([mock_event])
      get :edit, :workout_session_id => "2", :id => "37"
      assigns[:workout_history].should equal(mock_workout_history)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created workout_history as @workout_history" do
        mock_workout_history.stub(:save).and_return(true)
		WorkoutSession.stub(:find).and_return(mock_workout_session)
	    Event.stub(:find).and_return([mock_event])
        post :create, :workout_session_id => "2", :workout_history => {:these => 'params'}
        assigns[:workout_history].should equal(mock_workout_history)
      end

     
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved workout_history as @workout_history" do
        mock_workout_history.stub(:save).and_return(false)
		WorkoutSession.stub(:find).and_return(mock_workout_session)
	    Event.stub(:find).and_return([mock_event])
        post :create, :workout_session_id => "2", :workout_history => {:these => 'params'}
        assigns[:workout_history].should equal(mock_workout_history)
      end

      it "re-renders the 'new' template" do
        mock_workout_history.stub(:save).and_return(false)
		WorkoutSession.stub(:find).and_return(mock_workout_session)
	    Event.stub(:find).and_return([mock_event])
        post :create, :workout_session_id => "2", :workout_history => {}
        response.should render_template('new')
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested workout_history" do
        mock_workout_history.stub(:update_attributes).with({'these' => 'params'}).and_return(true)
        mock_workout_history.should_receive(:update_attributes).with({'these' => 'params'})
		WorkoutSession.stub(:find).and_return(mock_workout_session)
	    Event.stub(:find).and_return([mock_event])
        put :update, :workout_session_id => "2", :id => "37", :workout_history => {:these => 'params'}
      end

      it "assigns the requested workout_history as @workout_history" do
        mock_workout_history.stub(:update_attributes).and_return(true)
		WorkoutSession.stub(:find).and_return(mock_workout_session)
	    Event.stub(:find).and_return([mock_event])
        put :update, :workout_session_id => "2", :id => "1"
        assigns[:workout_history].should equal(mock_workout_history)
      end

      it "redirects to the workout_history" do
        mock_workout_history.stub(:update_attributes).and_return(true)
		WorkoutSession.stub(:find).and_return(mock_workout_session)
	    Event.stub(:find).and_return([mock_event])
        put :update, :workout_session_id => "2", :id => "1"
      end
    end

    describe "with invalid params" do
      it "updates the requested workout_history" do
        mock_workout_history.stub(:update_attributes).with({'these' => 'params'}).and_return(false)
        mock_workout_history.should_receive(:update_attributes).with({'these' => 'params'})
		WorkoutSession.stub(:find).and_return(mock_workout_session)
	    Event.stub(:find).and_return([mock_event])
        put :update, :workout_session_id => "2",:id => "37", :workout_history => {:these => 'params'}
      end

      it "assigns the workout_history as @workout_history" do
        mock_workout_history.stub(:update_attributes).and_return(false)
		WorkoutSession.stub(:find).and_return(mock_workout_session)
	    Event.stub(:find).and_return([mock_event])
        put :update, :workout_session_id => "2",:id => "1"
        assigns[:workout_history].should equal(mock_workout_history)
      end

      it "re-renders the 'edit' template" do
         mock_workout_history.stub(:update_attributes).and_return(false)
		 WorkoutSession.stub(:find).and_return(mock_workout_session)
	    Event.stub(:find).and_return([mock_event])
        put :update, :workout_session_id => "2",:id => "1"
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested workout_history" do
      mock_workout_history.should_receive(:destroy)
	  WorkoutSession.stub(:find).and_return(mock_workout_session)
	  Event.stub(:find).and_return([mock_event])
      delete :destroy, :workout_session_id => "2",:id => "37"
    end

    it "redirects to the workout_histories list" do
      mock_workout_history.stub(:destroy).and_return(true)
	  WorkoutSession.stub(:find).and_return(mock_workout_session)
	  Event.stub(:find).and_return([mock_event])
      delete :destroy, :workout_session_id => "2",:id => "37"
      response.should redirect_to(workout_histories_url)
    end
  end
   describe "RENDER partial" do
	it "renders complete_exercise_form" do
	WorkoutSession.stub(:find).and_return(mock_workout_session)
	  get :render_update_actual
	  response.should render_template("workout_histories/_complete_exercise_form")
	end
  end
end
