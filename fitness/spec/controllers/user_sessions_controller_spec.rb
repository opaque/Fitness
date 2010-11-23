require 'spec_helper'

describe UserSessionsController do


  def mock_user_session(stubs={})
    @mock_user_session ||= mock_model(UserSession, {:priority_record= => nil, :persisting? => true, :record => ""}.merge(stubs))
  end
  
  
  /#before (:each) do
    login
    @mock_user_session.stub!(:user_id=).with(:all).and_return(1)
  end #/
  
  describe "GET new" do
    it "assigns a new usersession as @usersession" 
  end
  
  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created usersession as @usersession" 

      it "redirects to the created usersession" do
        UserSession.stub(:new).and_return(mock_user_session(:save => true))
        post :create, :user_session => {}
        response.should redirect_to(root_path)
      end
    end

    describe "with invalid params" do
      #it "assigns a newly created but unsaved usersession as @usersession" 

     # it "re-renders the 'new' template" 
    end

  end
  describe "DELETE destroy" do
    #it "destroys the requested usersession" 

    #it "redirects to the usersessions list" 
  end
end