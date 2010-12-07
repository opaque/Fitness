require 'spec_helper'

describe Profile do
  before(:each) do
    @valid_attributes = {
      :height => 64,
	  :weight => 128,
	  :first_name => "John",
	  :last_name => "Doe",
	  :gender => "male",
	  :user_id => 1
	  
    }
  end

  it "should create a new instance given valid attributes" do
    Profile.create!(@valid_attributes)
  end
  
  it "should not create a new instance if missing a user_id" do
	@invalid_attributes = {
      :height => 64,
	  :weight => 128,
	  :first_name => "John",
	  :last_name => "Doe",
	  :gender => "male"
    }
	Profile.create(@invalid_attributes).should be_false
  end
  
  it "should not create a new instance if height/weight is negative" do
    @invalid_attributes1 = {
      :height => -3,
	  :weight => 128,
	  :first_name => "John",
	  :last_name => "Doe",
	  :gender => "male",
	  :user_id => 1
    }
	Profile.create(@invalid_attributes1).should be_false
	
	@invalid_attributes2 = {
      :height => 3,
	  :weight => -16,
	  :first_name => "John",
	  :last_name => "Doe",
	  :gender => "male",
	  :user_id => 1
    }
	Profile.create(@invalid_attributes2).should be_false
  end
  
  it "should not create a new instance if gender is specified incorrectly" do
	@invalid_attributes = {
      :height => 3,
	  :weight => 128,
	  :first_name => "John",
	  :last_name => "Doe",
	  :gender => "Bob Dole",
	  :user_id => 1
    }
	Profile.create(@invalid_attributes).should be_false
  end
  
end
