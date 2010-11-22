class EventsController < ApplicationController
  
  before_filter :require_user

  # GET /events
  # GET /events.xml
  def index
    @date = Time.parse("#{params[:start_date]} || Time.now.utc")
    @date = @date - (@date.wday==0 ? 0 : @date.wday).days
    @start_date = Date.new(@date.year, @date.month, @date.day)
    @end_date = @start_date + 7
    @events = Event.find(:all, :conditions => ['(start_at between ? and ?) or (end_at between ? and ?) or (start_at < ? and end_at > ?)',
                                                @start_date, @end_date, @start_date, @end_date, @start_date, @end_date])
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @events }
    end
  end

  # GET /events/1
  # GET /events/1.xml
  def show
    @event = Event.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @event }
    end
  end

  # GET /events/new
  # GET /events/new.xml
  def new
    @event = Event.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @event }
    end
  end

  # GET /events/1/edit
  def edit
    @event = Event.find(params[:id])
  end

  # POST /events
  # POST /events.xml
  def create
    @event = Event.new(params[:event])

    respond_to do |format|
      if @event.save
        format.html { redirect_to(events_path, :notice => 'Event was successfully created.') }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @event.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /events/1
  # PUT /events/1.xml
  def update
    @event = Event.find(params[:id])

    respond_to do |format|
      if @event.update_attributes(params[:event])
        format.html { redirect_to(@event, :notice => 'Event was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @event.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.xml
  def destroy
    @event = Event.find(params[:id])
    @event.destroy

    respond_to do |format|
      format.html { redirect_to(events_url) }
      format.xml  { head :ok }
    end
  end
  
  def event_workout_history
    @event = Event.find(params[:id])
  end
  
end
