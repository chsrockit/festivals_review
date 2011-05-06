class CreateEvents < ActiveRecord::Migration
  def self.up
    create_table :events, :force => true do |t|
      t.string :name
      t.integer :festival_id
      t.integer :show_id
      t.integer :venue_id
      t.float :score

      t.timestamps
    end
  end

  def self.down
    drop_table :events
  end
end
