class CreateProfiles < ActiveRecord::Migration
  def self.up
    create_table :profiles do |t|
      t.integer :height
      t.integer :weight
      t.string :first_name
      t.string :last_name
      t.string :gender
	  t.integer :user_id

      t.timestamps
    end
  end

  def self.down
    drop_table :profiles
  end
end
