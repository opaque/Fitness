require 'spec_helper'

describe "/exercises/show.html.erb" do
  include ExercisesHelper
  before(:each) do
    assigns[:exercise] = @exercise = stub_model(Exercise)
  end

  it "renders attributes in <p>" do
    render
  end
end
