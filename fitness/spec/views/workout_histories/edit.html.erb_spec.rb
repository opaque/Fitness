require 'spec_helper'

describe "/workout_histories/edit.html.erb" do
  include WorkoutHistoriesHelper

  before(:each) do
    assigns[:workout_history] = @workout_history = stub_model(WorkoutHistory,
      :new_record? => false
    )
  end

  it "renders the edit workout_history form" do
    render

    response.should have_tag("form[action=#{workout_history_path(@workout_history)}][method=post]") do
    end
  end
end
