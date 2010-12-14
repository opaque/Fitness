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
  
  
	
  describe "GET new" do
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
        post :create, :user => {}, :profile => {}
		Profile.stub(:new).and_return(mock_user(:save => true))
        response.should redirect_to(root_path)
		flash[:notice] = "Account registered!"
      end
    end

    describe "with invalid params" do
      it "redirects to the same page" do
        User.stub(:new).and_return(mock_user(:save => false))
		flash[:error] = "Please try again!"
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
        #User.should_receive(:find).with("37").and_return(mock_user)
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

  /#describe "DELETE destroy" do
    it "destroys the requested user" do
      User.should_receive(:find).with("37").and_return(mock_user)
      mock_user.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the users list" do
      User.stub(:find).and_return(mock_user(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(users_url)
    end 
  end #/

end
