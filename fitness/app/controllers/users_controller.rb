
require 'gchart'


class UsersController < ApplicationController
  before_filter :require_no_user, :only => [ :new, :create]
  before_filter :require_user, :only => [:show, :edit, :update, :graph]
  

 
  
  

  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(params[:user])
	@profile = Profile.new(params[:profile])
	
    if @user.save 
	  @profile.user_id = @user.id
	  if @profile.save
        flash[:notice] = "Account and profile registered!"
        redirect_back_or_default root_url
	  end
    else
      render :action => :new
    end
  end
  
  def show
    @user = @current_user
  end

  def edit
    @user = @current_user
  end
  
  def update
    @user = @current_user # makes our views "cleaner" and more consistent
    if @user.update_attributes(params[:user])
      flash[:notice] = "Account updated!"
      redirect_to root_url
    else
      render :action => :edit
    end
  end
  
  def graph
	@user = @curret_user
	
	@events = Event.find(:all, :conditions => ['user_id = ?', current_user.id])
	
	@actual_data = Array.new
	@actual_data.push(0)
	@estimated_data = Array.new
	@estimated_data.push(0)
	
	@events.each do |event|
		@workout_sess = event.workout_sessions
		@workout_sess.each do |workout_sess|
			@estimated_data.push(workout_sess.estimated_reps)
		end
		@workout_histories = event.workout_histories
		@workout_histories.each do |workout_history|
			@actual_data.push(workout_history.actual_reps)
		end
	end
	
	@g = Gchart.line(:title => "Actual vs Estimated Reps",
                     :data => [@actual_data, @estimated_data],
                     :line_colors => 'FF0000,00FF00',
                     :legend => ["Actual Reps", "Estimate Reps"],
                     :axis_with_labels => ['x','y'],
					 :size => '600x400')
	
	if (@actual_data.size == 1 || @estimated_data.size == 1)
		flash[:notification] = "No data yet-- please add data!"
	end
	
	respond_to do |format|
		format.html # graph.html.erb
		#format.xml  { render xml => @workout_histories }
		format.xml  { render xml => @g }
    end
  end
  
  
end