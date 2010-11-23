require 'spec_helper'

describe ExercisesController do

  before{ login }

  def mock_exercise(stubs={})
    @mock_exercise ||= mock_model(Exercise, stubs)
  end

  describe "GET index" do
    it "assigns all exercises as @exercises" do
      Exercise.stub(:find).with(:all).and_return([mock_exercise])
      get :index
      assigns[:exercises].should == [mock_exercise]
    end
  end

  describe "GET show" do
    it "assigns the requested exercise as @exercise" do
      Exercise.stub(:find).with("37").and_return(mock_exercise)
      get :show, :id => "37"
      assigns[:exercise].should equal(mock_exercise)
    end
  end

  describe "GET new" do
    it "assigns a new exercise as @exercise" do
      Exercise.stub(:new).and_return(mock_exercise)
      get :new
      assigns[:exercise].should equal(mock_exercise)
    end
  end

  describe "GET edit" do
    it "assigns the requested exercise as @exercise" do
      Exercise.stub(:find).with("37").and_return(mock_exercise)
      get :edit, :id => "37"
      assigns[:exercise].should equal(mock_exercise)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created exercise as @exercise" do
        Exercise.stub(:new).with({'these' => 'params'}).and_return(mock_exercise(:save => true))
        post :create, :exercise => {:these => 'params'}
        assigns[:exercise].should equal(mock_exercise)
      end

      it "redirects to the created exercise" do
        Exercise.stub(:new).and_return(mock_exercise(:save => true))
        post :create, :exercise => {}
        response.should redirect_to(exercise_url(mock_exercise))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved exercise as @exercise" do
        Exercise.stub(:new).with({'these' => 'params'}).and_return(mock_exercise(:save => false))
        post :create, :exercise => {:these => 'params'}
        assigns[:exercise].should equal(mock_exercise)
      end

      it "re-renders the 'new' template" do
        Exercise.stub(:new).and_return(mock_exercise(:save => false))
        post :create, :exercise => {}
        response.should render_template('new')
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested exercise" do
        Exercise.should_receive(:find).with("37").and_return(mock_exercise)
        mock_exercise.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :exercise => {:these => 'params'}
      end

      it "assigns the requested exercise as @exercise" do
        Exercise.stub(:find).and_return(mock_exercise(:update_attributes => true))
        put :update, :id => "1"
        assigns[:exercise].should equal(mock_exercise)
      end

      it "redirects to the exercise" do
        Exercise.stub(:find).and_return(mock_exercise(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(exercise_url(mock_exercise))
      end
    end

    describe "with invalid params" do
      it "updates the requested exercise" do
        Exercise.should_receive(:find).with("37").and_return(mock_exercise)
        mock_exercise.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :exercise => {:these => 'params'}
      end

      it "assigns the exercise as @exercise" do
        Exercise.stub(:find).and_return(mock_exercise(:update_attributes => false))
        put :update, :id => "1"
        assigns[:exercise].should equal(mock_exercise)
      end

      it "re-renders the 'edit' template" do
        Exercise.stub(:find).and_return(mock_exercise(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested exercise" do
      Exercise.should_receive(:find).with("37").and_return(mock_exercise)
      mock_exercise.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the exercises list" do
      Exercise.stub(:find).and_return(mock_exercise(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(exercises_url)
    end
  end

end
