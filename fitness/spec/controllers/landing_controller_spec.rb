require 'spec_helper'


describe LandingController do
  describe "handling GET index" do
	it "should render the index template" do
	  get :index
	  controller.should render_template("index")
	end
	it "should render the menu_one partial" do
	  get :menu_one
	  controller.should render_template("landing/_menu1")
	end
	it "should render the menu_two partial" do
	  get :menu_two
	  controller.should render_template("landing/_menu2")
	end
	it "should render the menu_two partial" do
	  get :menu_three
	  controller.should render_template("landing/_menu3")
	end
  end
end