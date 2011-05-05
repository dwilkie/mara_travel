class CreateImages < ActiveRecord::Migration
  def self.up
    create_table :images do |t|
      t.string :title
      t.string :filename
      t.string :caption
      t.references :trip
      t.references :experience
      t.timestamps
    end
  end

  def self.down
    drop_table :images
  end
end

