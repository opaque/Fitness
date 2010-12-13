class CreateWorkoutHistories < ActiveRecord::Migration
  def self.up
    create_table :workout_histories do |t|
      t.integer :actual_reps
      t.integer :actual_sets
	  t.float	:actual_weight
	  t.float :actual_mins
      t.integer :calories
	  t.integer :workout_session_id
      t.timestamps
    end
	
	add_index :workout_histories, :workout_session_id, :name => 'index_on_session_id'
  end

  def self.down
    drop_table :workout_histories
  end
end
