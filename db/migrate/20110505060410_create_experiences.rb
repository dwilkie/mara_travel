class CreateExperiences < ActiveRecord::Migration
  def self.up
    create_table :experiences do |t|
      t.references :activity
      t.references :location
      t.timestamps
    end
  end

  def self.down
    drop_table :experiences
  end
end

