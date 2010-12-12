require 'spec_helper'

describe Event do
  before(:each) do
    user = User.new
    @valid_attributes = {
      :starttime  => DateTime.now,
      :endtime=> DateTime.now >> 1,
      :title => "value for name",
      :description => "something",
      :event_type => "value for event_type",
      :user_id => 5
    }
    
    @recurring_event = {
      :starttime  => Time.now,
      :endtime=> Time.now,
      :title => "value for name",
      :description => "something",
      :event_type => "value for event_type",
      :user_id => 5,
      :period => "monthly"
    }
    
  end

  it "should create a new instance given valid attributes" do
    validEvent = Event.create!(@valid_attributes).should be_true
  end
  
  it "should not allow the user to create an event with bad times" do
    @nonvalid_attributes = {
      :starttime=> Time.now,
      :endtime=> Time.now-1,
      :title => "value for name",
      :description => "something",
      :event_type => "value for event_type",
      :user_id => 5
    }
    nonvalid = Event.create(@nonvalid_attributes)
    Event.find(:all).should_not include(nonvalid)
  end
  
  it "should update a current event" do
  validEvent = Event.create(@recurring_event)
  puts validEvent, EventSeries.find(:all)
  end
end
