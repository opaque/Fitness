require 'spec_helper'

describe "/exercises/new.html.erb" do
  include ExercisesHelper

  before(:each) do
    assigns[:exercise] = stub_model(Exercise,
      :new_record? => true
    )
  end

  it "renders new exercise form" do
    render

    response.should have_tag("form[action=?][method=post]", exercises_path) do
    end
  end
end
