class CreateWorkoutSessions < ActiveRecord::Migration
  def self.up
    create_table :workout_sessions do |t|
      t.integer :estimated_reps
      t.integer :estimated_sets
	  t.integer :event_id
	  t.integer :exercise_id
<<<<<<< HEAD
	  t.integer :estimated_mins
=======
>>>>>>> d95212f32e9142aeafba8fb43c174926448f0c6b

      t.timestamps
    end
  end

  def self.down
    drop_table :workout_sessions
  end
end
