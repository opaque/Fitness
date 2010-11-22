class CreateEvents < ActiveRecord::Migration
  def self.up
    create_table :events do |t|
      t.datetime :start_at
      t.datetime :end_at
      t.string :name
      t.string :event_type
      t.timestamps
    end
  end

  def self.down
    drop_table :events
  end
end
