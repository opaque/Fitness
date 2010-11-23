require 'spec_helper'

describe "/workout_sessions/index.html.erb" do
  include WorkoutSessionsHelper

  before(:each) do
    assigns[:workout_sessions] = [
      stub_model(WorkoutSession),
      stub_model(WorkoutSession)
    ]
  end

  it "renders a list of workout_sessions" do
    render
  end
end
