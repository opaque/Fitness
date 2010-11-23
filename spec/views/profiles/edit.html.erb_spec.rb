require 'spec_helper'

describe "/profiles/edit.html.erb" do
  include ProfilesHelper

  before(:each) do
    assigns[:profile] = @profile = stub_model(Profile,
      :new_record? => false
    )
  end

  it "renders the edit profile form" do
    render

    response.should have_tag("form[action=#{profile_path(@profile)}][method=post]") do
    end
  end
end
