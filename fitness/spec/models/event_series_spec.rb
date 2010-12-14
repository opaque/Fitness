require 'spec_helper'

describe EventSeries do
  before(:each) do    
    @valid_attributes = {
      :starttime  => Time.now,
      :endtime=> Time.now,
      :title => "value for name",
      :description => "something",
      :event_type => "value for event_type",
      :user_id => 5,
      :period => "Monthly"
    }
 
    @invalid_attributes = {
      :starttime  =>'hi',
      :endtime=> 'bye',
      :title => "value for name",
      :description => "something",
      :event_type => "value for event_type",
      :user_id => 5,
      :period => "Weekly"
    }
    
    
  end

  context "when given a new instance given valid attributes" do
    it "create valid monthly event series" do
      EventSeries.stub!(:r_period).with(@valid_attributes[:period]).and_return('months')
      events = mock_model(Event, :create => 'does not matter')
      valid = EventSeries.create(@valid_attributes)
      EventSeries.find(:all).should include(valid)
    end
    it "create valid daily event series" do
      @valid_attributes[:period] = "Daily" 
      EventSeries.stub!(:r_period).with(@valid_attributes[:period]).and_return('days')
      events = mock_model(Event, :create => 'does not matter')
      valid = EventSeries.create(@valid_attributes)
      EventSeries.find(:all).should include(valid)
    end
    it "create valid weekly event series" do
      @valid_attributes[:period] = "Weekly" 
      EventSeries.stub!(:r_period).with(@valid_attributes[:period]).and_return('weeks')
      events = mock_model(Event, :create => 'does not matter')
      valid = EventSeries.create(@valid_attributes)
      EventSeries.find(:all).should include(valid)
    end
    it "create valid yearly event series" do
      @valid_attributes[:period] = "Yearly" 
      EventSeries.stub!(:r_period).with(@valid_attributes[:period]).and_return('years')
      events = mock_model(Event, :create => 'does not matter')
      valid = EventSeries.create(@valid_attributes)
      EventSeries.find(:all).should include(valid)
    end
  end
  
  context "when given a new instance of invalid attributes" do
    it "gives an invalid string for DateTime's parser" do
      DateTime.stub!(:parse).with("sup").and_raise(ArgumentError)
      events = mock_model(Event, :create => 'does not matter')
      invalid = EventSeries.new(@valid_attributes)
      invalid.stub!(:events).and_return(events)
      invalid.create_events_until(END_TIME).should rescue()
    end
    it "given invalid start time and/or end time" do 
      invalid = EventSeries.create(@invalid_attributes)
      EventSeries.find(:all).should_not include(invalid)
    end
  end
  
  
end
