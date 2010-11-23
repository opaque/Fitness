require 'spec_helper'

describe WorkoutSessionsController do
  describe "routing" do
    it "recognizes and generates #index" do
      { :get => "/workout_sessions" }.should route_to(:controller => "workout_sessions", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/workout_sessions/new" }.should route_to(:controller => "workout_sessions", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/workout_sessions/1" }.should route_to(:controller => "workout_sessions", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/workout_sessions/1/edit" }.should route_to(:controller => "workout_sessions", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/workout_sessions" }.should route_to(:controller => "workout_sessions", :action => "create") 
    end

    it "recognizes and generates #update" do
      { :put => "/workout_sessions/1" }.should route_to(:controller => "workout_sessions", :action => "update", :id => "1") 
    end

    it "recognizes and generates #destroy" do
      { :delete => "/workout_sessions/1" }.should route_to(:controller => "workout_sessions", :action => "destroy", :id => "1") 
    end
  end
end
