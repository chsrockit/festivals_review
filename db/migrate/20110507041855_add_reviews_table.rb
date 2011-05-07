class AddReviewsTable < ActiveRecord::Migration
  def self.up
    create_table :reviews do |t|
      t.integer :show_id
      t.string :author
      t.float :score
      t.text :body_text
      t.string :source
      t.string :url
    end
  end

  def self.down
    drop_table :reviews
  end
end
