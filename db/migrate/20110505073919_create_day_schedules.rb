class CreateDaySchedules < ActiveRecord::Migration
  def self.up
    create_table :day_schedules do |t|
      t.references :day
      t.references :trip
      t.integer    :sequence
      t.timestamps
    end
  end

  def self.down
    drop_table :day_schedules
  end
end

