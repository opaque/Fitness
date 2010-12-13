class EventsController < ApplicationController
  before_filter :require_user
  def new
    @event = Event.new(:endtime => 1.hour.from_now, :period => "Does not repeat")
  end
  
  def create
    #debugger
    eventParams = params[:event]
    eventParams[:user_id] = current_user.id
    if eventParams[:title].strip().empty?
      eventParams[:title] = '(no title)'
    end
    if params[:event][:period] == "Does not repeat"
      @event = Event.new(eventParams)
    else
      #      @event_series = EventSeries.new(:frequency => params[:event][:frequency], :period => params[:event][:repeats], :starttime => params[:event][:starttime], :endtime => params[:event][:endtime], :all_day => params[:event][:all_day])
      @event_series = EventSeries.new(eventParams)
    end
    #debugger
  end
  
  def index
    
  end
  
  def show
    get_events
  end
  
  
  def get_events
    @events = Event.find(:all, :conditions => ["starttime >= '#{Time.at(params['start'].to_i).to_formatted_s(:db)}' and endtime <= '#{Time.at(params['end'].to_i).to_formatted_s(:db)}' and user_id = '#{current_user.id}'"] )
    events = [] 
    @events.each do |event|
      events << {:id => event.id, :user_id => current_user.id, :title => event.title, :description => event.description || "Some cool description here...", :start => "#{event.starttime.iso8601}", :end => "#{event.endtime.iso8601}", :allDay => event.all_day, :recurring => (event.event_series_id)? true: false}
    end
    render :text => events.to_json
  end
  
  
  
  def move
    @event = Event.find_by_id params[:id]
    if @event
      @event.starttime = (params[:minute_delta].to_i).minutes.from_now((params[:day_delta].to_i).days.from_now(@event.starttime))
      @event.endtime = (params[:minute_delta].to_i).minutes.from_now((params[:day_delta].to_i).days.from_now(@event.endtime))
      @event.all_day = params[:all_day]
      @event.save
    end
  end
  
  
  def resize
    @event = Event.find_by_id params[:id]
    if @event
      @event.endtime = (params[:minute_delta].to_i).minutes.from_now((params[:day_delta].to_i).days.from_now(@event.endtime))
      @event.save
    end    
  end
  
  def edit
    @event = Event.find_by_id(params[:id])
	#@workout_session = @event.workout_sessions.build
  end
  
  def update
    @event = Event.find_by_id(params[:event][:id])
    if params[:event][:commit_button] == "Update All Occurrence"
      @events = @event.event_series.events #.find(:all, :conditions => ["starttime > '#{@event.starttime.to_formatted_s(:db)}' "])
      @event.update_events(@events, params[:event])
    elsif params[:event][:commit_button] == "Update All Following Occurrence"
      @events = @event.event_series.events.find(:all, :conditions => ["starttime > '#{@event.starttime.to_formatted_s(:db)}' "])
      @event.update_events(@events, params[:event])
    else
      @event.attributes = params[:event]
      @event.save
    end

    render :update do |page|
      page<<"$('#calendar').fullCalendar( 'refetchEvents' )"
      page<<"$('#desc_dialog').dialog('destroy')" 
    end
    
  end  
  
  def destroy
    @event = Event.find_by_id(params[:id])
    if params[:delete_all] == 'true'
      @event.event_series.destroy
    elsif params[:delete_all] == 'future'
      @events = @event.event_series.events.find(:all, :conditions => ["starttime > '#{@event.starttime.to_formatted_s(:db)}' "])
      @event.event_series.events.delete(@events)
    else
      @event.destroy
    end
    
    render :update do |page|
      page<<"$('#calendar').fullCalendar( 'refetchEvents' )"
      page<<"$('#desc_dialog').dialog('destroy')" 
    end
    
  end
  
  def event_workout_history
    @event = Event.find(params[:id])
  end
  
  def update_exercise_menu
	@exercises = Exercise.find(:all, :conditions => ['exercise_type = ?', params[:exercise_type]])
	render :layout => false
  end
  
  def new_session
	@event = Event.find(params[:id])
	@workout_session = @event.workout_sessions.build
  end
  
  
  def make_session
	@event = Event.find(params[:id])
	if params[:workout_session][:commit_button] == "Add to All Occurences"
      @events = @event.event_series.events #.find(:all, :conditions => ["starttime > '#{@event.starttime.to_formatted_s(:db)}' "])
      @events.each do |event_x|
		  event_x.add_workout_session_and_history(params[:workout_session])
	  end
    elsif params[:workout_session][:commit_button] == "Add to Following Occurrences"
      @events = @event.event_series.events.find(:all, :conditions => ["starttime > '#{@event.starttime.to_formatted_s(:db)}' "])
      @events.each do |event_x|
		  event_x.add_workout_session_and_history(params[:workout_session])
	  end
    else
	  @event.add_workout_session_and_history(params[:workout_session])
    end
	
	#render :update do |page|
	#	page.replace_html 'event_desc', :partial => 'new_session_form'
	#end
	 
  end


  
end
