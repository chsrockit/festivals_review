class CreateVenues < ActiveRecord::Migration
  def self.up
    create_table :venues do |t|
      t.string :name
      t.integer :festival_id
      t.string :address
      t.float :score

      t.timestamps
    end
  end

  def self.down
    drop_table :venues
  end
end
