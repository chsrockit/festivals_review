class AddFestivalToVenue < ActiveRecord::Migration
  def self.up
    add_column :venues, :festival_id, :integer
  end

  def self.down
    remove_column :venues, :festival_id
  end
end
