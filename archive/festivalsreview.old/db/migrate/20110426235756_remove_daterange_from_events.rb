class RemoveDaterangeFromEvents < ActiveRecord::Migration
  def self.up
    remove_column :events, :startdate
    remove_column :events, :enddate
    add_column    :events, :festival_id, :integer
    add_column    :events, :venue_id, :integer
    add_column    :events, :show_id, :integer
  end

  def self.down
    remove_column    :events, :starts, :datetime
    remove_column    :events, :ends, :datetime
    remove_column    :events, :festival_id, :integer
    remove_column    :events, :venue_id, :integer
    remove_column    :events, :venue_id, :integer
  end
end
