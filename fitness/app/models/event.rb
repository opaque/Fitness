class Event < ActiveRecord::Base
  has_many :workout_sessions
  belongs_to :user
  has_many :exercises, :through => :workout_sessions
  has_many :workout_histories, :through => :workout_sessions
end
