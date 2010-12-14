require 'spec_helper'

describe UserSessionsController do


  def mock_user_session(stubs={})
    @mock_user_session ||= mock_model(UserSession, {:priority_record= => nil, :persisting? => true, :record => ""}.merge(stubs))
  end
  
  
  before (:each) do
    login
    @controller.stub!(:require_no_user).and_return(true)
  end 
  
  describe "GET new" do
    it "should render the new page" do
      get :new
      response.should render_template("new")
    end
  end
  
  describe "POST create" do

    describe "with valid params" do

      it "redirects to the created usersession" do
        UserSession.stub(:new).and_return(mock_user_session(:save => true))
        post :create, :user_session => {}
        response.should redirect_to(root_path)
		flash[:notice] = "Login successful!"
      end
    end

    describe "with invalid params" do
      it "redirects to the session_new"# do
        #UserSession.stub(:new).and_return(mock_user_session(:save => false))
#		flash[:error].should == "Please check your username or password and try again."
 #     end
    end

  end
  describe "DELETE destroy" do
  #  it "should destroy the user_session" do 	
  #    @user_session = UserSession.stub(:new).and_return(mock_user_session)
  #    @user_session.should_receive(:destroy)
   #   @controller.stub!(:current_user_session).and_return(@session)
    #  @controller.stub!(:require_user).and_return(true)
    #  delete :destroy
    #  flash[:notice].should == "Logout successful!"
    #end
  end
end