
require 'gchart'


class UsersController < ApplicationController
  before_filter :require_no_user, :only => [ :new, :create]
  before_filter :require_user, :only => [:show, :edit, :update, :graph]
  
  layout 'application'

  def new
    @user = User.new
  end
  
  def create
    @user = User.new(params[:user])
	@profile = Profile.new(params[:profile])
	
    if @user.save 
	  @profile.user_id = @user.id
	  if @profile.save
        flash[:notice] = "Account registered!"
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

@annotated_timeline = GoogleCharts::AnnotatedTimeline.new(
  :width => 500, :height => 240, :thickness => 1, :fill => 50
  
)


@annotated_timeline.add_column("Date",Date)
@annotated_timeline.add_column("Age",Float)
@annotated_timeline.add_column("Weight",Float)


@annotated_timeline.add_values("Date",[1.day.ago,2.day.ago,3.day.ago,11.day.ago])
@annotated_timeline.add_values("Age",[8,10,13,15])
@annotated_timeline.add_values("Weight",[12,23,24,35])

@bar_chart = GoogleCharts::BarChart.new(
  :width => 500, :height => 240, :title => 'Individual Performance'
  
)


@bar_chart.add_column("String",String)
@bar_chart.add_column("Estimated Reps",Float)
@bar_chart.add_column("Actual Reps",Float)
@bar_chart.add_column("Estimated Sets",Float)
@bar_chart.add_column("Actual Sets",Float)


@bar_chart.add_values("String",["Bicep","Tricep","Quadricep","Hamstring"])
@bar_chart.add_values("Estimated Reps",[8,10,13,15])
@bar_chart.add_values("Actual Reps",[12,23,24,35])
@bar_chart.add_values("Estimated Sets",[8,10,13,15])
@bar_chart.add_values("Actual Sets",[12,23,24,35])

	
	respond_to do |format|
		format.html # graph.html.erb
		#format.xml  { render xml => @workout_histories }
		format.xml  { render xml => @g }
    end
  end
  
  
end