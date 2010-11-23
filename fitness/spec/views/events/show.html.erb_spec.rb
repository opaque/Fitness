require 'spec_helper'

describe "/events/show.html.erb" do
  include EventsHelper
  before(:each) do
    assigns[:event] = @event = stub_model(Event,
      :name => "value for name",
      :event_type => "value for event_type"
    )
  end

  it "renders attributes in <p>" do
    pending #render
    response.should have_text(/value\ for\ name/)
    response.should have_text(/value\ for\ event_type/)
  end
end
