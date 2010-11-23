require 'spec_helper'

describe "/workout_histories/new.html.erb" do
  include WorkoutHistoriesHelper

  before(:each) do
    assigns[:workout_history] = stub_model(WorkoutHistory,
      :new_record? => true
    )
  end

  it "renders new workout_history form" do
    render

    response.should have_tag("form[action=?][method=post]", workout_histories_path) do
    end
  end
end
