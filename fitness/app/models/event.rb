class Event < ActiveRecord::Base
  has_many :workout_sessions
end
