class User < ActiveRecord::Base
  acts_as_authentic
  has_one :profile, :dependent => :destroy
  has_many :events, :dependent => :destroy

  
  validates_presence_of :login, :crypted_password
  
  
end
