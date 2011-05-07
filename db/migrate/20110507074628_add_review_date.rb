class AddReviewDate < ActiveRecord::Migration
  def self.up
    add_column :reviews, :review_date, :timestamp
  end

  def self.down
    remove_column :reviews, :review_date
  end
end
