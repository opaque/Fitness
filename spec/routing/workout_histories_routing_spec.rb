require 'spec_helper'

describe WorkoutHistoriesController do
  describe "routing" do
    it "recognizes and generates #index" do
      { :get => "/workout_histories" }.should route_to(:controller => "workout_histories", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/workout_histories/new" }.should route_to(:controller => "workout_histories", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/workout_histories/1" }.should route_to(:controller => "workout_histories", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/workout_histories/1/edit" }.should route_to(:controller => "workout_histories", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/workout_histories" }.should route_to(:controller => "workout_histories", :action => "create") 
    end

    it "recognizes and generates #update" do
      { :put => "/workout_histories/1" }.should route_to(:controller => "workout_histories", :action => "update", :id => "1") 
    end

    it "recognizes and generates #destroy" do
      { :delete => "/workout_histories/1" }.should route_to(:controller => "workout_histories", :action => "destroy", :id => "1") 
    end
  end
end
