require 'spec_helper'

describe WorkoutHistoriesController do

  def mock_workout_history(stubs={})
    @mock_workout_history ||= mock_model(WorkoutHistory, stubs)
  end

  describe "GET index" do
    it "assigns all workout_histories as @workout_histories" do
      WorkoutHistory.stub(:find).with(:all).and_return([mock_workout_history])
      get :index
      assigns[:workout_histories].should == [mock_workout_history]
    end
  end

  describe "GET show" do
    it "assigns the requested workout_history as @workout_history" do
      WorkoutHistory.stub(:find).with("37").and_return(mock_workout_history)
      get :show, :id => "37"
      assigns[:workout_history].should equal(mock_workout_history)
    end
  end

  describe "GET new" do
    it "assigns a new workout_history as @workout_history" do
      WorkoutHistory.stub(:new).and_return(mock_workout_history)
      get :new
      assigns[:workout_history].should equal(mock_workout_history)
    end
  end

  describe "GET edit" do
    it "assigns the requested workout_history as @workout_history" do
      WorkoutHistory.stub(:find).with("37").and_return(mock_workout_history)
      get :edit, :id => "37"
      assigns[:workout_history].should equal(mock_workout_history)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created workout_history as @workout_history" do
        WorkoutHistory.stub(:new).with({'these' => 'params'}).and_return(mock_workout_history(:save => true))
        post :create, :workout_history => {:these => 'params'}
        assigns[:workout_history].should equal(mock_workout_history)
      end

      it "redirects to the created workout_history" do
        WorkoutHistory.stub(:new).and_return(mock_workout_history(:save => true))
        post :create, :workout_history => {}
        response.should redirect_to(workout_history_url(mock_workout_history))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved workout_history as @workout_history" do
        WorkoutHistory.stub(:new).with({'these' => 'params'}).and_return(mock_workout_history(:save => false))
        post :create, :workout_history => {:these => 'params'}
        assigns[:workout_history].should equal(mock_workout_history)
      end

      it "re-renders the 'new' template" do
        WorkoutHistory.stub(:new).and_return(mock_workout_history(:save => false))
        post :create, :workout_history => {}
        response.should render_template('new')
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested workout_history" do
        WorkoutHistory.should_receive(:find).with("37").and_return(mock_workout_history)
        mock_workout_history.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :workout_history => {:these => 'params'}
      end

      it "assigns the requested workout_history as @workout_history" do
        WorkoutHistory.stub(:find).and_return(mock_workout_history(:update_attributes => true))
        put :update, :id => "1"
        assigns[:workout_history].should equal(mock_workout_history)
      end

      it "redirects to the workout_history" do
        WorkoutHistory.stub(:find).and_return(mock_workout_history(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(workout_history_url(mock_workout_history))
      end
    end

    describe "with invalid params" do
      it "updates the requested workout_history" do
        WorkoutHistory.should_receive(:find).with("37").and_return(mock_workout_history)
        mock_workout_history.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :workout_history => {:these => 'params'}
      end

      it "assigns the workout_history as @workout_history" do
        WorkoutHistory.stub(:find).and_return(mock_workout_history(:update_attributes => false))
        put :update, :id => "1"
        assigns[:workout_history].should equal(mock_workout_history)
      end

      it "re-renders the 'edit' template" do
        WorkoutHistory.stub(:find).and_return(mock_workout_history(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested workout_history" do
      WorkoutHistory.should_receive(:find).with("37").and_return(mock_workout_history)
      mock_workout_history.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the workout_histories list" do
      WorkoutHistory.stub(:find).and_return(mock_workout_history(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(workout_histories_url)
    end
  end

end
