require 'spec_helper'

describe WorkoutSession do
  before(:each) do
    @valid_attributes = {
      
    }
  end

  it "should create a new instance given valid attributes" do
    WorkoutSession.create!(@valid_attributes)
  end
end
