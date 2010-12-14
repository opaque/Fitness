class WorkoutSessionsController < ApplicationController
  before_filter :require_user
  before_filter :get_event, :except => :update_exercise_menu

  
  def get_event
	@event = Event.find(params[:event_id])
  end
  
  # GET /workout_sessions
  # GET /workout_sessions.xml
  def index
    @workout_sessions = @event.workout_sessions

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @workout_sessions }
    end
  end

  # GET /workout_sessions/1
  # GET /workout_sessions/1.xml
  def show
    @workout_session = @event.workout_sessions.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @workout_session }
    end
  end

  # GET /workout_sessions/new
  # GET /workout_sessions/new.xml
  def new
    @workout_session = @event.workout_sessions.build

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @workout_session }
    end
  end

  # GET /workout_sessions/1/edit
  def edit
    @workout_session = @event.workout_sessions.find(params[:id])
  end

  # POST /workout_sessions
  # POST /workout_sessions.xml
   def create
	
    @workout_session = @event.workout_sessions.build(params[:workout_session])
	@workout_session.estimate_time
	@workout_history = WorkoutHistory.new(params[:workout_history])
	
      if @workout_session.save
	    @workout_history.workout_session_id = @workout_session.id
		if @workout_history.save
			render :layout => false
        end
      end
    
  end

  # PUT /workout_sessions/1
  # PUT /workout_sessions/1.xml
  def update
    @workout_session = @event.workout_sessions.find(params[:id])
      if @workout_session.update_attributes(params[:workout_session])
		render :nothing => true
      end
    
  end

  # DELETE /workout_sessions/1
  # DELETE /workout_sessions/1.xml
  def destroy
    @workout_session = @event.workout_sessions.find(params[:id])
    @workout_session.destroy
  end
  
  
  def update_exercise_menu
	@exercises = Exercise.find(:all, :conditions => ['exercise_type = ?', params[:exercise_type]])
	render :layout => false
  end
  
  
  def render_show
	render :partial => 'show_session_data'
  end
  
  def render_edit
	@workout_session = WorkoutSession.find(params[:id])
	render :partial => 'edit_session_data'
  end
 
  
  
end
