class CreateWorkoutHistories < ActiveRecord::Migration
  def self.up
    create_table :workout_histories do |t|
      t.integer :actual_reps
      t.integer :actual_sets
	  t.float :actual_mins
      t.integer :calories
	  t.integer :workout_session_id
      t.timestamps
    end
  end

  def self.down
    drop_table :workout_histories
  end
end
