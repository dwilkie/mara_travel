class CreateTrips < ActiveRecord::Migration
  def self.up
    create_table :trips do |t|
      t.string :title
      t.text   :description
      t.boolean :published, :null => false, :default => false
      t.references :user
      t.timestamps
    end
  end

  def self.down
    drop_table :trips
  end
end

