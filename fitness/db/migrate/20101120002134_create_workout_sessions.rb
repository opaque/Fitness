class CreateWorkoutSessions < ActiveRecord::Migration
  def self.up
    create_table :workout_sessions do |t|
      t.integer :estimated_reps
      t.integer :estimated_sets
	  t.float	:estimated_weight
	  t.integer :event_id
	  t.integer :exercise_id

	  t.float :estimated_mins


      t.timestamps
    end
	
	add_index :workout_sessions, :event_id, :name => 'index_on_event_id'
	add_index :workout_sessions, :exercise_id, :name => 'index_on_exercise_id'
  end

  def self.down
    drop_table :workout_sessions
  end
end
