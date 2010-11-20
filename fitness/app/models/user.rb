class User < ActiveRecord::Base
  acts_as_authentic
  has_many: workout_sessions
  has_one: profile
  has_many: events, through: workout_sessions
end
