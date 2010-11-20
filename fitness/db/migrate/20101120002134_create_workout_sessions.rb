class CreateWorkoutSessions < ActiveRecord::Migration
  def self.up
    create_table :workout_sessions do |t|
      t.integer :estimated_reps
      t.integer :estimated_sets
	  t.integer :user_id
	  t.integer :event_id
	  t.integer :exercise_id

      t.timestamps
    end
  end

  def self.down
    drop_table :workout_sessions
  end
end
