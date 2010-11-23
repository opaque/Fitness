require 'spec_helper'

describe "/exercises/index.html.erb" do
  include ExercisesHelper

  before(:each) do
    assigns[:exercises] = [
      stub_model(Exercise),
      stub_model(Exercise)
    ]
  end

  it "renders a list of exercises" do
    render
  end
end
