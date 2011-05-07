class AddTimestampsToReviews < ActiveRecord::Migration
  def self.up
    add_column :reviews, :created_at, :timestamp
    add_column :reviews, :updated_at, :timestamp
  end

  def self.down
    remove_column :reviews, :created_at
    remove_column :reviews, :updated_at
  end
end
