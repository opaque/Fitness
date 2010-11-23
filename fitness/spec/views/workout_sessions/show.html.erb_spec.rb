require 'spec_helper'

describe "/workout_sessions/show.html.erb" do
  include WorkoutSessionsHelper
  before(:each) do
    assigns[:workout_session] = @workout_session = stub_model(WorkoutSession)
  end

  it "renders attributes in <p>" do
    render
  end
end
