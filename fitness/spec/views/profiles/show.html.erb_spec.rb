require 'spec_helper'

describe "/profiles/show.html.erb" do
  include ProfilesHelper
  before(:each) do
    assigns[:profile] = @profile = stub_model(Profile)
  end

  it "renders attributes in <p>" do
    render
  end
end
