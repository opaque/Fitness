class User < ActiveRecord::Base
  acts_as_authentic
  has_one :profile, :dependent => :destroy
  has_many :events, :dependent => :destroy

  
  validates_presence_of :login, :crypted_password
  
  def mets_graph
	@exercises = Exercise.find(:all)

	@column_chart = GoogleCharts::ColumnChart.new(
		:width => 500, :height => 240, :title => 'Exercise METs (Metabolic Equivalent of Task)')

	@column_chart.add_column("Exercise",String)		
	@column_chart.add_column("METs",Float)

	@exercise_names = Array.new
	@exercise_mets = Array.new
	@exercises.each do |exercise|
		@exercise_names.push(exercise.name)
		@exercise_mets.push(exercise.mets)
	end
	
	@column_chart.add_values("Exercise",@exercise_names)
	@column_chart.add_values("METs",@exercise_mets)
	
	@column_chart
  end
  
  def calories_graph(user)
	@calories_burned = GoogleCharts::AnnotatedTimeline.new(
		:width => 500, :height => 240, :thickness => 1)
	@calories_burned.add_column("Date",Date)
	@calories_burned.add_column("Calories Burned",Float)

	@events = Event.find(:all, :conditions => ['user_id = ?', user.id])
	
	@profile = Profile.find(:first, :conditions => ['user_id = ?', user.id])
	
	@calories = Array.new
	@dates = Array.new
	
	if (not @profile.weight)
		@calories.push(0)
		@date = DateTime.now
		@year= @date.year
		@month = @date.month
		@day = @date.day
		@dates.push(DateTime.new(@year, @month, @day) << 1)
	elsif (@events.empty?)
		@calories.push(0)
		@date = DateTime.now
		@year= @date.year
		@month = @date.month
		@day = @date.day
		@dates.push(DateTime.new(@year, @month, @day) << 1)
	else
		@kg = @profile.weight * 0.4539 
	
		@events.each do |event|
			@workout_sess = event.workout_sessions.find(:all, :conditions => ['event_id = ?', event.id])
			@event_calories = 0
			@workout_sess.each do |workout_sess|
				@mins = workout_sess.estimated_mins
				@exercise = Exercise.find(:first, :conditions => ['id = ?', workout_sess.exercise_id])
				@mets = @exercise.mets
				@event_calories += ((@mets * @kg * 3.5) / 200) * @mins	
			end
			@calories.push(@event_calories)
			@date = event.starttime
			@year= @date.year
			@month = @date.month
			@day = @date.day
			@dates.push(DateTime.new(@year, @month, @day) << 1)
		end
	end

	@calories_burned.add_values("Date",@dates)
	@calories_burned.add_values("Calories Burned",@calories)
	
	@calories_burned
  end
  
  def pounds_graph(user)
	@pounds_lost = GoogleCharts::AnnotatedTimeline.new(
		:width => 550, :height => 240, :thickness => 1)
	@pounds_lost.add_column("Date",Date)
	@pounds_lost.add_column("Total Pounds Lost Over Time",Float)

	@events = Event.find(:all, :conditions => ['user_id = ?', user.id])
	
	@profile = Profile.find(:first, :conditions => ['user_id = ?', user.id])
	
	@pounds = Array.new
	@total_pounds = 0
	
	if (not @profile.weight)
		@pounds.push(0)
		@date = DateTime.now
		@year= @date.year
		@month = @date.month
		@day = @date.day
		@dates.push(DateTime.new(@year, @month, @day) << 1)
	elsif (@events.empty?)
		@pounds.push(0)
		@date = DateTime.now
		@year= @date.year
		@month = @date.month
		@day = @date.day
		@dates.push(DateTime.new(@year, @month, @day) << 1)
	else
		@kg = @profile.weight * 0.4539 
	
		@events.each do |event|
			@workout_sess = event.workout_sessions.find(:all, :conditions => ['event_id = ?', event.id])
			@event_calories = 0
			@workout_sess.each do |workout_sess|
				@mins = workout_sess.estimated_mins
				@exercise = Exercise.find(:first, :conditions => ['id = ?', workout_sess.exercise_id])
				@mets = @exercise.mets
				@event_calories += ((@mets * @kg * 3.5) / 200) * @mins	
			end	
			@total_pounds += @event_calories / 3500
			@pounds.push(@total_pounds)
			@date = event.starttime
			@year= @date.year
			@month = @date.month
			@day = @date.day
			@dates.push(DateTime.new(@year, @month, @day) << 1)
		end	
	end
	
		@pounds_lost.add_values("Date",@dates)
		@pounds_lost.add_values("Total Pounds Lost Over Time",@pounds)
	
		@pounds_lost
  end
	
end
