class CreateFestivals < ActiveRecord::Migration
  def self.up
    create_table :festivals do |t|
      t.string :name
      t.datetime :start_date
      t.datetime :end_date
      t.float :score

      t.timestamps
    end
  end

  def self.down
    drop_table :festivals
  end
end
