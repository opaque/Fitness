require 'spec_helper'

describe Exercise do
  before(:each) do
    @valid_attributes = {
      
    }
  end

  it "should create a new instance given valid attributes" do
    Exercise.create!(@valid_attributes)
  end
end
