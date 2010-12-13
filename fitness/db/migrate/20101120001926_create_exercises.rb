class CreateExercises < ActiveRecord::Migration
  def self.up
    create_table :exercises do |t|
      t.string :name
      t.string :exercise_type
	  t.float :mets
      t.timestamps
    end
	
	add_index :exercises, [:name, :exercise_type], :name => 'index_on_name_type'
	
  end

  def self.down
    drop_table :exercises
  end
end
