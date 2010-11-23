require 'spec_helper'

describe Event do
  before(:each) do
    @valid_attributes = {
      :start_at => Time.now,
      :end_at => Time.now,
      :name => "value for name",
      :event_type => "value for event_type"
    }
  end

  it "should create a new instance given valid attributes" do
    Event.create!(@valid_attributes)
  end
end
