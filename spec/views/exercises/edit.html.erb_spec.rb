require 'spec_helper'

describe "/exercises/edit.html.erb" do
  include ExercisesHelper

  before(:each) do
    assigns[:exercise] = @exercise = stub_model(Exercise,
      :new_record? => false
    )
  end

  it "renders the edit exercise form" do
    render

    response.should have_tag("form[action=#{exercise_path(@exercise)}][method=post]") do
    end
  end
end
