# == Schema Information
# Schema version: 20100330111833
#
# Table name: events
#
#  id              :integer(4)      not null, primary key
#  title           :string(255)
#  starttime       :datetime
#  endtime         :datetime
#  all_day         :boolean(1)
#  created_at      :datetime
#  updated_at      :datetime
#  description     :text
#  event_series_id :integer(4)
#

class Event < ActiveRecord::Base
  attr_accessor :period, :frequency, :commit_button, :empty_title
  
  #validates_presence_of :title
  
  belongs_to :event_series
  has_many :workout_sessions, :dependent => :destroy
  belongs_to :user
  has_many :exercises, :through => :workout_sessions
  has_many :workout_histories, :through => :workout_sessions
  validates_presence_of :user_id, :starttime, :endtime

  
  REPEATS = [
              "Does not repeat",
              "Daily"          ,
              "Weekly"         ,
              "Monthly"        ,
              "Yearly"         
  ]
  
  def validate
    if (starttime >= endtime) and !all_day
      errors.add_to_base("Start Time must be less than End Time")
    end
  end
  
  
  
  def add_workout_session_and_history(session)
	  session.delete(:commit_button)
	  @workout_session = self.workout_sessions.build(session)
	  @workout_session.estimate_time
	  @workout_history = WorkoutHistory.new
		  if @workout_session.save
			@workout_history.workout_session_id = @workout_session.id
			if not @workout_history.save
				@workout_session.destroy
			end
		  end
  end
  
  
  
end
