require 'spec_helper'

describe "/workout_sessions/new.html.erb" do
  include WorkoutSessionsHelper

  before(:each) do
    assigns[:workout_session] = stub_model(WorkoutSession,
      :new_record? => true
    )
  end

  it "renders new workout_session form" do
    render

    response.should have_tag("form[action=?][method=post]", workout_sessions_path) do
    end
  end
end
