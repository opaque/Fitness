require 'spec_helper'

describe ExercisesController do
  describe "routing" do
    it "recognizes and generates #index" do
      { :get => "/exercises" }.should route_to(:controller => "exercises", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/exercises/new" }.should route_to(:controller => "exercises", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/exercises/1" }.should route_to(:controller => "exercises", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/exercises/1/edit" }.should route_to(:controller => "exercises", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/exercises" }.should route_to(:controller => "exercises", :action => "create") 
    end

    it "recognizes and generates #update" do
      { :put => "/exercises/1" }.should route_to(:controller => "exercises", :action => "update", :id => "1") 
    end

    it "recognizes and generates #destroy" do
      { :delete => "/exercises/1" }.should route_to(:controller => "exercises", :action => "destroy", :id => "1") 
    end
  end
end
