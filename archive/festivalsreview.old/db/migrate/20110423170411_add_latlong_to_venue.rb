class AddLatlongToVenue < ActiveRecord::Migration
  def self.up
    add_column :venues, :lat, :float
    add_column :venues, :long, :float
  end

  def self.down
    remove_column :venues, :long
    remove_column :venues, :lat
  end
end
