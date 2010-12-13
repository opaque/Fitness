require 'spec_helper'

describe WorkoutSessionsController do

	before(:each) do
		login
		Event.stub(:find).with("1").and_return(mock_event)
		mock_event.stub(:workout_sessions).and_return(mock_workout_session)
		mock_workout_session.stub(:destroy).and_return(true)
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
    it "assigns all workout_sessions as @workout_sessions" do
	  mock_event.stub(:workout_sessions).and_return([mock_workout_session])
      #WorkoutSession.stub(:find).with(:all).and_return([mock_workout_session])
      get :index, :event_id => "1"
      assigns[:workout_sessions].should == [mock_workout_session]
    end
  end

  describe "GET show" do
    it "assigns the requested workout_session as @workout_session" do
	  
      mock_workout_session.stub(:find).with("37").and_return(mock_workout_session)
      get :show, :event_id => "1", :id => "37"
      assigns[:workout_session].should equal(mock_workout_session)
    end
  end

  describe "GET new" do
    it "assigns a new workout_session as @workout_session" do
      
      mock_workout_session.stub(:build).and_return(mock_workout_session)
      get :new, :event_id => "1"
      assigns[:workout_session].should equal(mock_workout_session)
    end
  end

  describe "GET edit" do
    it "assigns the requested workout_session as @workout_session" do
	 
      mock_workout_session.stub(:find).with("37").and_return(mock_workout_session)      
	  get :edit, :event_id => "1", :id => "37"
      assigns[:workout_session].should equal(mock_workout_session)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created workout_session as @workout_session" do
		
        mock_workout_session.stub(:build).with({'these' => 'params'}).and_return(mock_workout_session(:save => true))
		mock_workout_session.stub(:save).and_return(true)
		mock_workout_session.stub(:estimate_time).and_return("6")
        post :create, :event_id => "1", :workout_session => {:these => 'params'}
        assigns[:workout_session].should equal(mock_workout_session)
      end
	 
	  
	  
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved workout_session as @workout_session" do
        
        mock_workout_session.stub(:build).with({'these' => 'params'}).and_return(mock_workout_session(:save => false))
		mock_workout_session.stub(:save).and_return(false)
		mock_workout_session.stub(:estimate_time).and_return("6")
        post :create, :event_id => "1", :workout_session => {:these => 'params'}
        assigns[:workout_session].should equal(mock_workout_session)
      end

      it "re-renders the 'new' template" do
        
		mock_workout_session.stub(:estimate_time).and_return("6")
        mock_workout_session.stub(:build).and_return(mock_workout_session(:save => false))
		mock_workout_session.stub(:save).and_return(false)
        post :create, :event_id => "1", :workout_session => {}
      end
	  
	  it "also re-renders the 'new' templateif history is invalid" do
        
        mock_workout_session.stub(:build).and_return(mock_workout_session(:save => true))
		mock_workout_session.stub(:id).and_return("37")
		WorkoutHistory.stub(:new).with({'these' => 'params'}).and_return(mock_workout_history)
		mock_workout_session.stub(:save).and_return(true)
		mock_workout_history.stub(:workout_session_id=).with("37").and_return(true)
		mock_workout_history.stub(:save).and_return(false)
		mock_workout_session.stub(:estimate_time).and_return("6")
        post :create, :event_id => "1", :workout_session => {}, :workout_history => {:these => 'params'}
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested workout_session" do
        mock_workout_session.should_receive(:find).with("37").and_return(mock_workout_session)
        mock_workout_session.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :event_id => "1", :id => "37", :workout_session => {:these => 'params'}
      end

      it "assigns the requested workout_session as @workout_session" do
        mock_workout_session.stub(:find).and_return(mock_workout_session(:update_attributes => true))
		mock_workout_session.stub(:update_attributes).and_return(true)
        put :update, :event_id => "1",:id => "1"
        assigns[:workout_session].should equal(mock_workout_session)
      end

      it "redirects to the workout_session" do
        mock_workout_session.stub(:find).and_return(mock_workout_session(:update_attributes => true))
		mock_workout_session.stub(:update_attributes).and_return(true)
        put :update, :event_id => "1", :id => "1"
      end
    end

    describe "with invalid params" do
      it "updates the requested workout_session" do
        mock_workout_session.should_receive(:find).with("37").and_return(mock_workout_session)
        mock_workout_session.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :event_id => "1", :id => "37", :workout_session => {:these => 'params'}
      end

      it "assigns the workout_session as @workout_session" do
        mock_workout_session.stub(:find).and_return(mock_workout_session(:update_attributes => false))
		mock_workout_session.stub(:update_attributes).and_return(false)
        put :update, :event_id => "1", :id => "1"
        assigns[:workout_session].should equal(mock_workout_session)
      end

      it "re-renders the 'edit' template" do
        mock_workout_session.stub(:find).and_return(mock_workout_session(:update_attributes => false))
		mock_workout_session.stub(:update_attributes).and_return(false)
        put :update, :event_id => "1", :id => "1"
        response.should render_template('update')
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested workout_session" do
      mock_workout_session.should_receive(:find).with("37").and_return(mock_workout_session)
	  
      mock_workout_session.should_receive(:destroy)
      delete :destroy, :event_id => "1", :id => "37"
    end

    it "redirects to the workout_sessions list" do
      mock_workout_session.stub(:find).and_return(mock_workout_session(:destroy => true))
	  
      delete :destroy, :event_id => "1", :id => "1"
    end
  end

end
