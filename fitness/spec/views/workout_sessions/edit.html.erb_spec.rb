require 'spec_helper'

describe "/workout_sessions/edit.html.erb" do
  include WorkoutSessionsHelper

  before(:each) do
    assigns[:workout_session] = @workout_session = stub_model(WorkoutSession,
      :new_record? => false
    )
  end

  it "renders the edit workout_session form" do
    render

    response.should have_tag("form[action=#{workout_session_path(@workout_session)}][method=post]") do
    end
  end
end
