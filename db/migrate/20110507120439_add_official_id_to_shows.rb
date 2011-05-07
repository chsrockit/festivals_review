class AddOfficialIdToShows < ActiveRecord::Migration
  def self.up
    add_column :shows, :official_id, :integer
  end

  def self.down
    remove_column :shows, :official_id
  end
end
