require 'spec_helper'

describe ProfilesController do

  def mock_profile(stubs={})
    @mock_profile ||= mock_model(Profile, stubs)
  end

  describe "GET index" do
    it "assigns all profiles as @profiles" do
      Profile.stub(:find).with(:all).and_return([mock_profile])
      get :index
      assigns[:profiles].should == [mock_profile]
    end
  end

  describe "GET show" do
    it "assigns the requested profile as @profile" do
      Profile.stub(:find).with("37").and_return(mock_profile)
      get :show, :id => "37"
      assigns[:profile].should equal(mock_profile)
    end
  end

  describe "GET new" do
    it "assigns a new profile as @profile" do
      Profile.stub(:new).and_return(mock_profile)
      get :new
      assigns[:profile].should equal(mock_profile)
    end
  end

  describe "GET edit" do
    it "assigns the requested profile as @profile" do
      Profile.stub(:find).with("37").and_return(mock_profile)
      get :edit, :id => "37"
      assigns[:profile].should equal(mock_profile)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created profile as @profile" do
        Profile.stub(:new).with({'these' => 'params'}).and_return(mock_profile(:save => true))
        post :create, :profile => {:these => 'params'}
        assigns[:profile].should equal(mock_profile)
      end

      it "redirects to the created profile" do
        Profile.stub(:new).and_return(mock_profile(:save => true))
        post :create, :profile => {}
        response.should redirect_to(profile_url(mock_profile))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved profile as @profile" do
        Profile.stub(:new).with({'these' => 'params'}).and_return(mock_profile(:save => false))
        post :create, :profile => {:these => 'params'}
        assigns[:profile].should equal(mock_profile)
      end

      it "re-renders the 'new' template" do
        Profile.stub(:new).and_return(mock_profile(:save => false))
        post :create, :profile => {}
        response.should render_template('new')
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested profile" do
        Profile.should_receive(:find).with("37").and_return(mock_profile)
        mock_profile.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :profile => {:these => 'params'}
      end

      it "assigns the requested profile as @profile" do
        Profile.stub(:find).and_return(mock_profile(:update_attributes => true))
        put :update, :id => "1"
        assigns[:profile].should equal(mock_profile)
      end

      it "redirects to the profile" do
        Profile.stub(:find).and_return(mock_profile(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(profile_url(mock_profile))
      end
    end

    describe "with invalid params" do
      it "updates the requested profile" do
        Profile.should_receive(:find).with("37").and_return(mock_profile)
        mock_profile.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :profile => {:these => 'params'}
      end

      it "assigns the profile as @profile" do
        Profile.stub(:find).and_return(mock_profile(:update_attributes => false))
        put :update, :id => "1"
        assigns[:profile].should equal(mock_profile)
      end

      it "re-renders the 'edit' template" do
        Profile.stub(:find).and_return(mock_profile(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested profile" do
      Profile.should_receive(:find).with("37").and_return(mock_profile)
      mock_profile.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the profiles list" do
      Profile.stub(:find).and_return(mock_profile(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(profiles_url)
    end
  end

end
