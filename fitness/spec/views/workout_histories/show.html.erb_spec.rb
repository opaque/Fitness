require 'spec_helper'

describe "/workout_histories/show.html.erb" do
  include WorkoutHistoriesHelper
  before(:each) do
    assigns[:workout_history] = @workout_history = stub_model(WorkoutHistory)
  end

  it "renders attributes in <p>" do
    render
  end
end
