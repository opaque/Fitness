require 'spec_helper'


describe LandingController do
  describe "handling GET index" do
	it "should render the index template" do
	  get :index
	  controller.should render_template("index" )
	end
  end
end