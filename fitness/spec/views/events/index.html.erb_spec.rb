require 'spec_helper'

describe "/events/index.html.erb" do
  include EventsHelper

  before(:each) do
    assigns[:events] = [
      stub_model(Event,
        :name => "value for name",
        :event_type => "value for event_type"
      ),
      stub_model(Event,
        :name => "value for name",
        :event_type => "value for event_type"
      )
    ]
  end

  it "renders a list of events" do
    pending #render 
    response.should have_tag("tr>td", "value for name".to_s, 2)
    response.should have_tag("tr>td", "value for event_type".to_s, 2)
  end
end
