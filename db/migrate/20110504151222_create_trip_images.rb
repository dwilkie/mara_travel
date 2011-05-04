class CreateTripImages < ActiveRecord::Migration
  def self.up
    create_table :trip_images do |t|
      t.references :image
      t.references :trip
      t.timestamps
    end
  end

  def self.down
    drop_table :trip_images
  end
end

