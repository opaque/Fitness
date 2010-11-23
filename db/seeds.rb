# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#   
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Major.create(:name => 'Daley', :city => cities.first)

exercises = [{ :name => 'curl', :exercise_type => 'bicep' }, { :name => 'squat', :exercise_type => 'quadraceps' }, { :name => 'bench press', :exercise_type => 'chest/pectoralis major' }, { :name => 'calf raises', :exercise_type => 'calfs' }, { :name => 'military press', :exercise_type => 'shoulders' }, { :name => ' reverse pulls up', :exercise_type => 'latissimus dorsi' }, { :name => 'jogging', :exercise_type => 'cardio' }, { :name => 'swimming', :exercise_type => 'cardio' }]

exercises.each do |e|
	Exercise.create(e)
end
	