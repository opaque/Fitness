class CreateExercises < ActiveRecord::Migration
  def self.up
    create_table :exercises do |t|
      t.string :name
      t.string :exercise_type
	t.float :mets

      t.timestamps
    end
  end

  def self.down
    drop_table :exercises
  end
end
