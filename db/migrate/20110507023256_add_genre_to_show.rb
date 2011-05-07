class AddGenreToShow < ActiveRecord::Migration
  def self.up
    add_column :shows, :genre, :string
  end

  def self.down
    remove_column :shows, :genre
  end
end
