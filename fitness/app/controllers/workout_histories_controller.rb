require 'gchart'

class WorkoutHistoriesController < ApplicationController
  # GET /workout_histories
  # GET /workout_histories.xml
  def index
    @workout_histories = WorkoutHistory.all
	
	@actual_data = Array.new
	@estimated_data = Array.new
	
	@workout_histories.each do |workout_history|
		@actual_data.push(workout_history[:actual_reps])
		@workout_sess = WorkoutSession.find(workout_history[:workout_session_id])
		@estimated_data.push(@workout_sess[:estimated_reps])
	end
	
	@g = Gchart.line(:title => "Actual vs Estimated Reps",
           :data => [@actual_data, @estimated_data], 
           :line_colors => 'FF0000,00FF00',
		   :legend => ["Actual Reps", "Estimate Reps"],
		   :axis_with_labels => ['x', 'y', 'r'])

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @workout_histories }
	  format.xml  { render :xml => @g }
    end
  end

  # GET /workout_histories/1
  # GET /workout_histories/1.xml
  def show
    @workout_history = WorkoutHistory.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @workout_history }
    end
  end
  
  def graph
    @workout_history = WorkoutHistory.new
	Gchart.line(:size => '200x300', 
				:title => "example title",
				:bg => 'efefef',
				:legend => ['first data set label', 'second data set label'],
				:data => [10, 30, 120, 45, 72])
	
	respond_to do |format|
      format.html # graph.html.erb
      format.xml  { render :xml => @workout_history }
    end
  end

  # GET /workout_histories/new
  # GET /workout_histories/new.xml
  def new
    @workout_history = WorkoutHistory.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @workout_history }
    end
  end

  # GET /workout_histories/1/edit
  def edit
    @workout_history = WorkoutHistory.find(params[:id])
  end

  # POST /workout_histories
  # POST /workout_histories.xml
  def create
    @workout_history = WorkoutHistory.new(params[:workout_history])

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
    @workout_history = WorkoutHistory.find(params[:id])

    respond_to do |format|
      if @workout_history.update_attributes(params[:workout_history])
        format.html { redirect_to(@workout_history, :notice => 'WorkoutHistory was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @workout_history.errors, :status => :unprocessable_entity }
      end
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
  

end
