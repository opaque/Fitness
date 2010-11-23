require 'spec_helper'

describe "/profiles/new.html.erb" do
  include ProfilesHelper

  before(:each) do
    assigns[:profile] = stub_model(Profile,
      :new_record? => true
    )
  end

  it "renders new profile form" do
    render

    response.should have_tag("form[action=?][method=post]", profiles_path) do
    end
  end
end
