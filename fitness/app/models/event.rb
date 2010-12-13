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
  validate :valid_time_period

  
  def valid_time_period
	errors.add(:endtime, 'ending time must be after starting time for event') if (endtime < starttime)
  end
  
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
  
  # events is all the events for a certain event series that need to be updated
  # event is the parameters of the event that needs to be updated
  def update_events(events, event)
    events.each do |e|
      begin 
        st, et = e.starttime, e.endtime
        e.attributes = event
        if event_series.period.downcase == 'monthly' or event_series.period.downcase == 'yearly'
          nst = DateTime.parse("#{e.starttime.hour}:#{e.starttime.min}:#{e.starttime.sec}, #{e.starttime.day}-#{st.month}-#{st.year}")  
          net = DateTime.parse("#{e.endtime.hour}:#{e.endtime.min}:#{e.endtime.sec}, #{e.endtime.day}-#{et.month}-#{et.year}")
        else
          nst = DateTime.parse("#{e.starttime.hour}:#{e.starttime.min}:#{e.starttime.sec}, #{st.day}-#{st.month}-#{st.year}")  
          net = DateTime.parse("#{e.endtime.hour}:#{e.endtime.min}:#{e.endtime.sec}, #{et.day}-#{et.month}-#{et.year}")
        end
        #puts "#{nst}           :::::::::          #{net}"
      rescue
        nst = net = nil
      end
      if nst and net
        #          e.attributes = event
        e.starttime, e.endtime = nst, net
        e.save
      end
    end
    
    event_series.attributes = event
    event_series.save
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
