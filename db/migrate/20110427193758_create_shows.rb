class CreateShows < ActiveRecord::Migration
  def self.up
    create_table :shows do |t|
      t.integer :festival_id
      t.integer :venue_id
      t.string :name
      t.datetime :start_date
      t.datetime :end_date
      t.float :score

      t.timestamps
    end
  end

  def self.down
    drop_table :shows
  end
end
