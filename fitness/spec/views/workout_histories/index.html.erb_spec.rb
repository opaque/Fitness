require 'spec_helper'

describe "/workout_histories/index.html.erb" do
  include WorkoutHistoriesHelper

  before(:each) do
    assigns[:workout_histories] = [
      stub_model(WorkoutHistory),
      stub_model(WorkoutHistory)
    ]
  end

  it "renders a list of workout_histories" do
    render
  end
end
