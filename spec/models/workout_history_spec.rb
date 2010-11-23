require 'spec_helper'

describe WorkoutHistory do
  before(:each) do
    @valid_attributes = {
      
    }
  end

  it "should create a new instance given valid attributes" do
    WorkoutHistory.create!(@valid_attributes)
  end
end
