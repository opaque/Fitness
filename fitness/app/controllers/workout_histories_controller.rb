#require 'gchart'

class WorkoutHistoriesController < ApplicationController
   before_filter :require_user, :get_event
  
  def get_event
	@workout_session = WorkoutSession.find(params[:workout_session_id])
	@event = Event.find(:all, :conditions => ['id = ?', @workout_session.event_id]).first
  end
  
  # GET /workout_histories
  # GET /workout_histories.xml  
  def index
    @workout_histories = @workout_session.workout_history
	respond_to do |format|
		format.html # index.html.erb
		format.xml  { render :xml => @workout_histories }

	
	end
  end

  # GET /workout_histories/1
  # GET /workout_histories/1.xml
  def show
    @workout_history = @workout_session.workout_history

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @workout_history }
    end
  end
  


  # GET /workout_histories/new
  # GET /workout_histories/new.xml
  def new
    @workout_history = @workout_session.workout_histories.build
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @workout_history }
    end
  end

  # GET /workout_histories/1/edit
  def edit
    @workout_history = @workout_session.workout_history
  end

  # POST /workout_histories
  # POST /workout_histories.xml
  def create
    @workout_history = @workout_session.workout_histories.build(params[:workout_history])

    respond_to do |format|
      if @workout_history.save
        format.html { redirect_to(@workout_history, :notice => 'WorkoutHistory was successfully created.') }
        format.xml  { render :xml => @workout_history, :status => :created, :location => @workout_history }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @workout_history.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /workout_histories/1
  # PUT /workout_histories/1.xml
  def update
    @workout_history = @workout_session.workout_history
	
    
      if @workout_history.update_attributes(params[:workout_history])
		render :layout => false #, partial => 'complete_exercise_form'
        #format.html { redirect_to(event_path(@event), :notice => 'WorkoutHistory was successfully updated.') }
        #format.xml  { head :ok }
      else
		render :layout => false
        #format.html { render :action => "edit" }
        #format.html { redirect_to(event_path(@event), :notice => 'failed' ) }
		#format.xml  { render :xml => @workout_history.errors, :status => :unprocessable_entity }
      end
    
  end

  # DELETE /workout_histories/1
  # DELETE /workout_histories/1.xml
  def destroy
    @workout_history = WorkoutHistory.find(params[:id])
    @workout_history.destroy

    respond_to do |format|
      format.html { redirect_to(workout_histories_url) }
      format.xml  { head :ok }
    end
  end
  
  def render_update_actual
	@workout_history = @workout_session.workout_history
	render :partial => 'complete_exercise_form'
  end
  

end
