class User < ActiveRecord::Base
  acts_as_authentic
  has_many :workout_sessions, :dependent => :destroy
  has_one :profile, :dependent => :destroy
  has_many :events, :through => :workout_sessions, :dependent => :destroy

  
  validates_presence_of :login, :crypted_password
  validates_uniqueness_of :login, :message => "%s has already been taken as a user name"
  
end
