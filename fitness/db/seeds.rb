# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#   
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Major.create(:name => 'Daley', :city => cities.first)
exercises = [{ :name => 'curl', :exercise_type => 'bicep', :mets => 3.5}, { :name => 'squat', :exercise_type => 'quadraceps', :mets => 3.6 }, { :name => 'bench press', :exercise_type => 'chest', :mets => 3.5 }, { :name => 'calf raises', :exercise_type => 'calves', :mets => 4.5 }, { :name => 'military press', :exercise_type => 'shoulders', :mets => 3.5 }, { :name => ' reverse pull ups', :exercise_type => 'latissimus dorsi', :mets => 8.0 }, { :name => 'jogging', :exercise_type => 'cardio', :mets => 7.0 }, { :name => 'swimming', :exercise_type => 'cardio', :mets => 8.0}]


exercises.each do |e|
	Exercise.create(e)
end
	