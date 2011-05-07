class AddEventTime < ActiveRecord::Migration
  def self.up
    add_column :events, :event_time, :timestamp
  end

  def self.down
    remove_column :events, :event_time
  end
end
