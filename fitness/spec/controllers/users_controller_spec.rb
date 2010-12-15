require 'spec_helper'


describe UsersController do

  before {login}
  
  def mock_user(stubs={})
    #@mock_user ||= mock_model(User, {:update_attributes => true}.merge(stubs))
	current_user
  end
  
  def current_user(stubs = {})
  @current_user ||= mock_model(User, {:update_attributes => true}.merge(stubs))
	end
	
  def mock_user2(stubs={})
    @mock_user ||= mock_model(User, stubs)
	
  end
  
  def mock_profile(stubs={})
    @mock_profile ||= mock_model(Profile, stubs)
	
  end
  
  def mock_event(stubs={})
    @mock_event ||= mock_model(Event, stubs)
	
  end
  
  
	
  describe "GET new" do
   before(:each) do
	 @controller.stub!(:require_no_user).and_return(true)
   end
    it "should render the new page" do
      get :new
      response.should render_template("new")
    end
  end

  describe "GET show" do
    it "assigns the requested user as @user" do
      User.stub(:find).with("37").and_return(mock_user)
      get :show, :id => "37"
      assigns[:user].should equal(mock_user)
    end
  end

  describe "GET edit" do
    it "assigns the requested user as @user" do
      User.stub(:find).with("37").and_return(mock_user)
      get :edit, :id => "37"
      assigns[:user].should equal(mock_user)
    end
  end

  describe "POST create" do

    describe "with valid params" do
	
	
      it "redirects to the root" do
        User.stub(:new).and_return(mock_user(:save => true))
        Profile.stub(:new).and_return(mock_profile(:save => true))
		mock_user.stub(:save).and_return(true)
		mock_profile.stub(:save).and_return(true)
		post :create, :user => {}, :profile => {}
		#flash[:notice].should == "Account registered!"
        response.should redirect_to(root_path)
      end
    end



  end

  describe "PUT update" do

    describe "with valid params" do

      it "assigns the requested user as @user" do
        mock_user.stub(:update_attributes).and_return(true)
        put :update, :id => "1"
        assigns[:user].should equal(mock_user)
      end

      it "redirects to the user" do
        mock_user.stub(:update_attributes).and_return(true)
        put :update, :id => "1"
        response.should redirect_to(root_url)
      end
    end

    describe "with invalid params" do
      it "updates the requested user" do
        mock_user.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :user => {:these => 'params'}
      end

      it "assigns the user as @user" do
        mock_user.stub(:update_attributes).and_return(false)
        put :update, :id => "1"
        assigns[:user].should equal(mock_user)
      end

      it "re-renders the 'edit' template" do
        mock_user.stub(:update_attributes).and_return(false)
        put :update, :id => "1"
        response.should render_template('edit')
      end
    end

  end
  
  describe "make graphs" do
	it "should create the 4 graphs given all data entered" do
		Event.stub(:find).and_return([mock_event])
		Profile.stub(:find).and_return(mock_profile)
		mock_profile.stub(:weight).and_return(100)
		mock_user.stub(:exercise_pie_graph).and_return(true)
		mock_user.stub(:mets_graph).and_return(true)
		mock_user.stub(:calories_graph).and_return(true)
		mock_user.stub(:pounds_graph).and_return(true)
		get :graph
	end
	
	it "should flash notification if weight not entered" do
		Event.stub(:find).and_return([mock_event])
		Profile.stub(:find).and_return(mock_profile)
		mock_profile.stub(:weight).and_return(nil)
		mock_user.stub(:exercise_pie_graph).and_return(true)
		mock_user.stub(:mets_graph).and_return(true)
		mock_user.stub(:calories_graph).and_return(true)
		mock_user.stub(:pounds_graph).and_return(true)
		get :graph
	end
	
	it "should flash notification if no events entered" do
		Event.stub(:find).and_return([])
		Profile.stub(:find).and_return(mock_profile)
		mock_profile.stub(:weight).and_return(100)
		mock_user.stub(:exercise_pie_graph).and_return(true)
		mock_user.stub(:mets_graph).and_return(true)
		mock_user.stub(:calories_graph).and_return(true)
		mock_user.stub(:pounds_graph).and_return(true)
		get :graph
	end
  end

end
