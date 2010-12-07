require 'spec_helper'

describe Exercise do
  before(:each) do
    @valid_attributes = {
      :name => "curl",
	  :exercise_type => "bicep"
    }
	
	
  end

  it "should create a new instance given valid attributes" do
    Exercise.create!(@valid_attributes)
  end
  
  it "should not create a new instance given incomplete attribute fields" do
    @invalid_attributes = {
	  :exercise_type => "bicep"
	}
	Exercise.create(@invalid_attributes).should be_false
  end
  
  it "should not create a new instance given not unique attributes" do
	@invalid_attributes = {
	  :name = "curl",
	  :exercise_type => "bicep"
	}
	Exercise.create(@valid_attributes)
	Exercise.create(@invalid_attributes).should be_false
  end
  
  it "should not create a new instance given a bad exercise type" do
    @invalid _attributes = {
	  :name = "curl",
	  :exercise_type => "mega awesome type"
	}
	Exercise.create(@invalid_attributes).should be_false
  end
  
  
end
