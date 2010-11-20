class Event < ActiveRecord::Base
  has_many :workout_sessions
  has_one :user, :through => :workout_sessions
end
