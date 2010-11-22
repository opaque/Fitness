class WorkoutSessionsController < ApplicationController

  
  # GET /workout_sessions
  # GET /workout_sessions.xml
  def index
    @workout_sessions = WorkoutSession.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @workout_sessions }
    end
  end

  # GET /workout_sessions/1
  # GET /workout_sessions/1.xml
  def show
    @workout_session = WorkoutSession.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @workout_session }
    end
  end

  # GET /workout_sessions/new
  # GET /workout_sessions/new.xml
  def new
	@event = Event.find(params[:event_id])
    @workout_session = @event.workout_sessions.build

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @workout_session }
    end
  end

  # GET /workout_sessions/1/edit
  def edit
    @workout_session = WorkoutSession.find(params[:id])
  end

  # POST /workout_sessions
  # POST /workout_sessions.xml
  def create
	@event = Event.find(params[:event_id])
    @workout_session = @event.workout_sessions.build(params[:workout_session])
    respond_to do |format|
      if @workout_session.save
        format.html { redirect_to(@workout_session, :notice => 'WorkoutSession was successfully created.') }
        format.xml  { render :xml => @workout_session, :status => :created, :location => @workout_session }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @workout_session.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /workout_sessions/1
  # PUT /workout_sessions/1.xml
  def update
    @workout_session = WorkoutSession.find(params[:id])

    respond_to do |format|
      if @workout_session.update_attributes(params[:workout_session])
        format.html { redirect_to(@workout_session, :notice => 'WorkoutSession was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @workout_session.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /workout_sessions/1
  # DELETE /workout_sessions/1.xml
  def destroy
    @workout_session = WorkoutSession.find(params[:id])
    @workout_session.destroy

    respond_to do |format|
      format.html { redirect_to(workout_sessions_url) }
      format.xml  { head :ok }
    end
  end
end
