require 'spec_helper'

describe WorkoutSessionsController do

  def mock_workout_session(stubs={})
    @mock_workout_session ||= mock_model(WorkoutSession, stubs)
  end

  describe "GET index" do
    it "assigns all workout_sessions as @workout_sessions" do
      WorkoutSession.stub(:find).with(:all).and_return([mock_workout_session])
      get :index
      assigns[:workout_sessions].should == [mock_workout_session]
    end
  end

  describe "GET show" do
    it "assigns the requested workout_session as @workout_session" do
      WorkoutSession.stub(:find).with("37").and_return(mock_workout_session)
      get :show, :id => "37"
      assigns[:workout_session].should equal(mock_workout_session)
    end
  end

  describe "GET new" do
    it "assigns a new workout_session as @workout_session" do
      WorkoutSession.stub(:new).and_return(mock_workout_session)
      get :new
      assigns[:workout_session].should equal(mock_workout_session)
    end
  end

  describe "GET edit" do
    it "assigns the requested workout_session as @workout_session" do
      WorkoutSession.stub(:find).with("37").and_return(mock_workout_session)
      get :edit, :id => "37"
      assigns[:workout_session].should equal(mock_workout_session)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created workout_session as @workout_session" do
        WorkoutSession.stub(:new).with({'these' => 'params'}).and_return(mock_workout_session(:save => true))
        post :create, :workout_session => {:these => 'params'}
        assigns[:workout_session].should equal(mock_workout_session)
      end

      it "redirects to the created workout_session" do
        WorkoutSession.stub(:new).and_return(mock_workout_session(:save => true))
        post :create, :workout_session => {}
        response.should redirect_to(workout_session_url(mock_workout_session))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved workout_session as @workout_session" do
        WorkoutSession.stub(:new).with({'these' => 'params'}).and_return(mock_workout_session(:save => false))
        post :create, :workout_session => {:these => 'params'}
        assigns[:workout_session].should equal(mock_workout_session)
      end

      it "re-renders the 'new' template" do
        WorkoutSession.stub(:new).and_return(mock_workout_session(:save => false))
        post :create, :workout_session => {}
        response.should render_template('new')
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested workout_session" do
        WorkoutSession.should_receive(:find).with("37").and_return(mock_workout_session)
        mock_workout_session.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :workout_session => {:these => 'params'}
      end

      it "assigns the requested workout_session as @workout_session" do
        WorkoutSession.stub(:find).and_return(mock_workout_session(:update_attributes => true))
        put :update, :id => "1"
        assigns[:workout_session].should equal(mock_workout_session)
      end

      it "redirects to the workout_session" do
        WorkoutSession.stub(:find).and_return(mock_workout_session(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(workout_session_url(mock_workout_session))
      end
    end

    describe "with invalid params" do
      it "updates the requested workout_session" do
        WorkoutSession.should_receive(:find).with("37").and_return(mock_workout_session)
        mock_workout_session.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :workout_session => {:these => 'params'}
      end

      it "assigns the workout_session as @workout_session" do
        WorkoutSession.stub(:find).and_return(mock_workout_session(:update_attributes => false))
        put :update, :id => "1"
        assigns[:workout_session].should equal(mock_workout_session)
      end

      it "re-renders the 'edit' template" do
        WorkoutSession.stub(:find).and_return(mock_workout_session(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested workout_session" do
      WorkoutSession.should_receive(:find).with("37").and_return(mock_workout_session)
      mock_workout_session.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the workout_sessions list" do
      WorkoutSession.stub(:find).and_return(mock_workout_session(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(workout_sessions_url)
    end
  end

end
