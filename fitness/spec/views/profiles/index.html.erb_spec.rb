require 'spec_helper'

describe "/profiles/index.html.erb" do
  include ProfilesHelper

  before(:each) do
    assigns[:profiles] = [
      stub_model(Profile),
      stub_model(Profile)
    ]
  end

  it "renders a list of profiles" do
    render
  end
end
