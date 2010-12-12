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
	@ex = Exercise.new(@invalid_attributes)
    @ex.should_not be_valid
  end
  
  it "should not create a new instance given not unique attributes" do
	@invalid_attributes = {
	  :name => "curl",
	  :exercise_type => "bicep"
	}
	Exercise.create(@valid_attributes)
	@ex = Exercise.new(@invalid_attributes)
    @ex.should_not be_valid
  end
  
  it "should not create a new instance given a bad exercise type" do
    @invalid_attributes = {
	  :name => "curl",
	  :exercise_type => "mega awesome type"
	}
	@ex = Exercise.new(@invalid_attributes)
    @ex.should_not be_valid
  end
  
  
end
