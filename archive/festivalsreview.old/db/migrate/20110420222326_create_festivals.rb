class CreateFestivals < ActiveRecord::Migration
  def self.up
    create_table :festivals do |t|
      t.string :name
      t.datetime  :startdate
      t.datetime  :enddate
      t.timestamps
    end
  end

  def self.down
    drop_table :festivals
  end
end
