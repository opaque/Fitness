
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
	  flash[:error] = "Please try again!"
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
	  flash[:error] = "Account failed to update. Please try again!"
      render :action => :edit
    end
  end
  
  def graph
	@user = @curret_user
	
	@events = Event.find(:all, :conditions => ['user_id = ?', @current_user.id])
	if (@events.empty?)
		flash[:notification] = "No workout sessions completed yet!--Please add data!"
	end
	
	@profile = Profile.find(:first, :conditions => ['user_id = ?', @current_user.id])
	if (not @profile.weight)
		flash[:notification] = "Weight not yet entered!--Please enter weight in profile!"
	end
	
	@pie_graph = @current_user.exercise_pie_graph(@current_user)
	
	@column_chart = @current_user.mets_graph

	@calories_burned = @current_user.calories_graph(@current_user)

	@pounds_lost = @current_user.pounds_graph(@current_user)

	
	respond_to do |format|
		format.html # graph.html.erb
		#format.xml  { render xml => @workout_histories }
		format.xml  { render xml => @g }
    end
  end
  
  def partial_test
	@column_chart = params[:data]
	render :partial => "graph1", :locals => {:data => @column_chart}
	#render :inline => "<%= google_vizualisation_tag('#{@column_chart}') %>"
  end
  
end