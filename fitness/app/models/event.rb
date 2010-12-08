class Event < ActiveRecord::Base
  has_many :workout_sessions, :dependent => :destroy
  belongs_to :user
  has_many :exercises, :through => :workout_sessions
  has_many :workout_histories, :through => :workout_sessions
  
  validates_presence_of :name, :user_id, :start_at, :end_at
  validate :valid_time_period
  
  def valid_time_period
	errors.add(:end_at, 'ending time must be after starting time for event') if (end_at < start_at)
  end
  
end
