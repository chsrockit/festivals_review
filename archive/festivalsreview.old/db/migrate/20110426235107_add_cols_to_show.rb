class AddColsToShow < ActiveRecord::Migration
  def self.up
    add_column :shows, :festival_id, :integer
    add_column :shows, :venue_id, :integer
    add_column :shows, :name, :string
    add_column :shows, :startdate, :datetime
    add_column :shows, :enddate, :datetime
  end

  def self.down
    remove_column :shows, :venue_id
    remove_column :shows, :festival_id
    remove_column :shows, :name
    remove_column :shows, :startdate
    remove_column :shows, :enddate
  end
end
