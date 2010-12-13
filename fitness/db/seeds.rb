# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#   
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Major.create(:name => 'Daley', :city => cities.first)
exercises = [{ :name => 'standing curl', :exercise_type => 'bicep', :mets => 3.5},{ :name => 'preacher curl', :exercise_type => 'bicep', :mets => 3.5}, { :name => 'sitting curl', :exercise_type => 'bicep', :mets => 3.5},{ :name => 'squat (weighted)', :exercise_type => 'quadraceps', :mets => 3.6 },{ :name => 'lunges (weighted)', :exercise_type => 'quadraceps', :mets => 3.6 }, { :name => 'dead lifts', :exercise_type => 'back', :mets => 3.6 }, { :name => 'back curl', :exercise_type => 'back', :mets => 3.6 },{ :name => 'bench press', :exercise_type => 'chest', :mets => 5.5 },{ :name => 'incline press', :exercise_type => 'chest', :mets => 6.5 }, { :name => 'decline press', :exercise_type => 'chest', :mets => 3.5 }, { :name => 'fly', :exercise_type => 'chest', :mets => 3.5 },{ :name => 'russian twists', :exercise_type => 'abdominal', :mets => 6.0},{ :name => 'V-ups', :exercise_type => 'abdominal', :mets => 6.0}, { :name => 'weighted sit ups', :exercise_type => 'abdominal', :mets => 6.0}, { :name => 'body curl', :exercise_type => 'abdominal', :mets => 6.0},{ :name => 'calf raises', :exercise_type => 'calves', :mets => 4.5 }, { :name => 'military press', :exercise_type => 'shoulders', :mets => 3.5 },{ :name => 'skull-crushers', :exercise_type => 'tricep', :mets => 4.0}, { :name => 'barbell presses', :exercise_type => 'tricep', :mets => 4.0},{ :name => 'tricep dips', :exercise_type => 'tricep', :mets => 4.0},{ :name => 'jogging', :exercise_type => 'cardio', :mets => 7.0 }, { :name => 'swimming', :exercise_type => 'cardio', :mets => 8.0},{ :name => 'rowing', :exercise_type => 'cardio', :mets => 8.0},{ :name => 'eliptical', :exercise_type => 'cardio', :mets => 7.0},{ :name => 'bicycling', :exercise_type => 'cardio', :mets => 7.0},{ :name => 'push ups', :exercise_type => 'calisthenics', :mets => 8.0}, { :name => 'crunches/sit ups', :exercise_type => 'calisthenics', :mets => 8.0},{ :name => 'pull ups', :exercise_type => 'calisthenics', :mets => 8.0},{ :name => 'squats', :exercise_type => 'calisthenics', :mets => 5.0},{ :name => 'jumping jacks', :exercise_type => 'calisthenics', :mets => 5.0},{ :name => 'lunges', :exercise_type => 'calisthenics', :mets => 8.0}]


exercises.each do |e|
	Exercise.create(e)
end
	